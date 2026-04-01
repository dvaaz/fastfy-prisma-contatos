/*
  Warnings:

  - The primary key for the `contacts` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `contacts` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `contacts` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `contacts` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `contacts` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `contacts` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `contacts` table. All the data in the column will be lost.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `createdAt` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `users` table. All the data in the column will be lost.
  - Added the required column `contactEmail` to the `contacts` table without a default value. This is not possible if the table is not empty.
  - The required column `contactId` was added to the `contacts` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `contactName` to the `contacts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `contactPhone` to the `contacts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `contactUpdatedAt` to the `contacts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `contacts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userEmail` to the `users` table without a default value. This is not possible if the table is not empty.
  - The required column `userId` was added to the `users` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `userName` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userUpdatedAt` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_contacts" (
    "contactId" TEXT NOT NULL PRIMARY KEY,
    "contactName" TEXT NOT NULL,
    "contactEmail" TEXT NOT NULL,
    "contactPhone" TEXT NOT NULL,
    "contactCreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "contactUpdatedAt" DATETIME NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "contacts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("userId") ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE "contacts";
ALTER TABLE "new_contacts" RENAME TO "contacts";
CREATE UNIQUE INDEX "contacts_contactEmail_key" ON "contacts"("contactEmail");
CREATE TABLE "new_users" (
    "userId" TEXT NOT NULL PRIMARY KEY,
    "userName" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,
    "userCreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userUpdatedAt" DATETIME NOT NULL
);
DROP TABLE "users";
ALTER TABLE "new_users" RENAME TO "users";
CREATE UNIQUE INDEX "users_userEmail_key" ON "users"("userEmail");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
