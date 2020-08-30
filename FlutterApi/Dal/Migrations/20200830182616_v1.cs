using Microsoft.EntityFrameworkCore.Migrations;

namespace Dal.Migrations
{
    public partial class v1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ProductPhotos_Products_prdocutId",
                table: "ProductPhotos");

            migrationBuilder.DropForeignKey(
                name: "FK_SubCategories_Products_prdocutId",
                table: "SubCategories");

            migrationBuilder.DropIndex(
                name: "IX_SubCategories_prdocutId",
                table: "SubCategories");

            migrationBuilder.DropIndex(
                name: "IX_ProductPhotos_prdocutId",
                table: "ProductPhotos");

            migrationBuilder.DropColumn(
                name: "prdocutId",
                table: "SubCategories");

            migrationBuilder.DropColumn(
                name: "prdocutId",
                table: "ProductPhotos");

            migrationBuilder.AddColumn<int>(
                name: "productId",
                table: "SubCategories",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "productId",
                table: "ProductPhotos",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_SubCategories_productId",
                table: "SubCategories",
                column: "productId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductPhotos_productId",
                table: "ProductPhotos",
                column: "productId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductPhotos_Products_productId",
                table: "ProductPhotos",
                column: "productId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SubCategories_Products_productId",
                table: "SubCategories",
                column: "productId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ProductPhotos_Products_productId",
                table: "ProductPhotos");

            migrationBuilder.DropForeignKey(
                name: "FK_SubCategories_Products_productId",
                table: "SubCategories");

            migrationBuilder.DropIndex(
                name: "IX_SubCategories_productId",
                table: "SubCategories");

            migrationBuilder.DropIndex(
                name: "IX_ProductPhotos_productId",
                table: "ProductPhotos");

            migrationBuilder.DropColumn(
                name: "productId",
                table: "SubCategories");

            migrationBuilder.DropColumn(
                name: "productId",
                table: "ProductPhotos");

            migrationBuilder.AddColumn<int>(
                name: "prdocutId",
                table: "SubCategories",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "prdocutId",
                table: "ProductPhotos",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_SubCategories_prdocutId",
                table: "SubCategories",
                column: "prdocutId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductPhotos_prdocutId",
                table: "ProductPhotos",
                column: "prdocutId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductPhotos_Products_prdocutId",
                table: "ProductPhotos",
                column: "prdocutId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SubCategories_Products_prdocutId",
                table: "SubCategories",
                column: "prdocutId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
