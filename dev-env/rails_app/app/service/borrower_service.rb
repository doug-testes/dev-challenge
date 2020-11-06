class BorrowerService

  def initialize()
  end

  def generate_review(borrower_request)

    start_date = DateTime.now + 1.month

    loan_result = calculate_loan(
      start_date,
      borrower_request.loan_amount_in_cents,
      borrower_request.rate,
      borrower_request.installments
    )
    borrower_request.assign_attributes(
      status: 'review',
      installments_amount_in_cents: loan_result[:result][:installment_amount_per_month],
      total_amount_payable_in_cents: loan_result[:result][:loan_amount_to_pay],
      start_date: start_date,
      end_date: loan_result[:result][:end_date]
    )

    if (borrower_request.save())
      return {result: borrower_request}
    else
      return {error: borrower_request.errors}
    end
  end

  def approve(borrower_request)

    borrower_request.installments.times.each do | installment_number |
      borrower_request.borrower_installments.create(
        amount_in_cents: borrower_request.installments_amount_in_cents ,
        due_date: borrower_request.start_date + installment_number.month,
        installment_number: (installment_number + 1)
      )
    end

    borrower_request.assign_attributes(
      status: 'approved'
    )

    if (borrower_request.save() and borrower_request.borrower_installments.count() == borrower_request.installments)
      return {result: borrower_request }
    else
      return {error: borrower_request }
    end

  end

  def calculate_loan(start_date, loan_amount, rate, number_installments, round = true)
    pmt = loan_amount * ((((1 + rate) ** number_installments) * rate) / (((1 + rate) ** number_installments) - 1))
    if (round)
      installment_amount_per_month = pmt.ceil
    else
      installment_amount_per_month = pmt
    end

    end_date = start_date + number_installments.month

    loan_amount_to_pay = installment_amount_per_month * number_installments

    return { result: { 
      loan_amount: loan_amount,
      loan_amount_to_pay: loan_amount_to_pay,
      installment_amount_per_month: installment_amount_per_month, 
      rate: rate,
      number_installments: number_installments,
      round: round,
      start_date: start_date, 
      end_date: end_date,

      } 
    }
    rescue e
      return { error: e}  
  end
end
