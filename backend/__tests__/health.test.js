import { describe, it, expect } from "vitest";
import request from "supertest";
import app from "../server.js";

describe("GET /health", () => {
  it("returns 200 with status ok", async () => {
    const response = await request(app).get("/health");

    expect(response.status).toBe(200);
    expect(response.body.status).toBe("Improvly Up!");
  });
});
