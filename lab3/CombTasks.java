
/** Combinatorics functions: permutations and combinations  */
public class CombTasks {

    /** Prints all k length permutations of alphabet el-s
     * (recursive function) */
    public static void allPermutations(char[] alphabet, int k, int i, char[] perm) {
        if (k == i) {
            System.out.println(perm);
            return;
        }

        for (char  el : alphabet) {
            perm[i] = el;
            allPermutations(alphabet, k, i + 1, perm);
        }
    }


    /** Prints all k length permutations of alphabet el-s
     * (not recursive function) */
    public static void allPermutations(char[] alphabet, int n, int k) {
        int[] permIndices = new int[k];
        Arrays.fill(permIndices, 0);
        int i = 0, counter = 1;
        while (true) {
            if (i == k - 1) {

                System.out.printf("%d: ", counter++);
                for (int j : permIndices) System.out.print(alphabet[j]);
                System.out.println();

                while (permIndices[i] == n - 1) {
                    if (i == 0) return;
                    permIndices[i] = 0;
                    i--;
                }

                permIndices[i] ++;

                i = 0;

            } else {
                i++;
            }
        }
    }
}