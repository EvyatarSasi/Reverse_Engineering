/*
 * rect.c שחזור של rect.exe
 *
 * הפונקציה sub_401000 בונה את המלבן.
 * השתמשתי ב __stdcall כי ב IDA הפונקציה מסתיימת ב retn 0Ch
 * והיא מקבלת 3 פרמטרים.
 */

#include <stdio.h>
#include <stdlib.h>

void __stdcall draw_rect(int base, int height, char *buffer)
{
    int pos = 0;   /* var_4 */
    int i = height;   /* var_8 */

    while (i > 0) {
        int j = base; /* var_C */

        while (j > 0) {
            if (i == height || i == 1 || j == base || j == 1) {
                buffer[pos] = '*';
            } else {
                buffer[pos] = ' ';
            }

            pos++;
            j--;
        }

        buffer[pos] = '\n';
        pos++;

        i--;
    }

    buffer[pos] = '\0';
}

int main(void)
{
    int base;
    int height;
    int size;
    char *buffer;

    printf("Enter base: ");
    scanf("%d", &base);

    printf("Enter height: ");
    scanf("%d", &height);

    /* base תווים + ירידת שורה לכל שורה + סיום מחרוזת */
    size = (base + 1) * height + 1;

    buffer = (char *)malloc(size);
    if (buffer == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }

    draw_rect(base, height, buffer);

    printf("%s", buffer);

    free(buffer);
    return 0;
}