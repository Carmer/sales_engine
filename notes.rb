# #no need to manipulate csv
# # def create(hash of all the inputs customers items etc)
#
#   #create invoice( all invoice inputs ... id created_at etc...)
#     data = hash with expected keys and corresponding values
#     #Invoice.new(data, self)
#
#
#     for next_id
#     @invoices.last.id +1
#     end
#
#     created at updated at = Time.now
#
#     to add items:
#     invoice.add_items(inputs[:items])
#
#     in invoice:
#
#     add_items(items)
#     #REMEMBER there could be repeats
#
#     #call group_by on items to group them by item id
#     #itterate through that result and for each pair..
#       #create an invoice item
#       #set the item id to the key
#       #set the quantity to the number of items in the value
#       #set the invoice it to my id
#       #add the invoice_item to the )invoice item rpo



count = Hash.new(0)

items = [1,1,1,2,3,4]

items.each do |i|
  count[i] += 1
end
count
