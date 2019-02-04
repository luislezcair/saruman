module InventoriesHelper
      def sorted_deposit
       Deposit.sorted
      end
      def sorted_family
       Family.sorted
      end
      def sorted_producer
       Producer.sorted
      end
end
