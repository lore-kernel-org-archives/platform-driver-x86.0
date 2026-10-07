Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9A936402A
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 21:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408678; cv=none; b=rVWOaIkWqXIpZpFpMNgVSouVbsQf4JJHjKK3Fo67wkkNwvSYbWZPxGlwH6dAlbZYoywI3vVnmoVZd5vsW8BBIhXbuz7O9IH3IcnICEMIQfpJwJq2wxJfwOdk5D9Gb9AtfM8AmR88vBdHh7kq4UW9x1ii8w+dJUyo+/Rqc84E/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408678; c=relaxed/simple;
	bh=Ez4WqaNYCW4tKr4bQHDt31QSh4VBDGd5N/6Lg1cKTOY=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID; b=JO+ySquBE727UF+2EMjc6qd57cy6KX7ZFjz6YymM//CuEjnHxC549EbziZGB8dGuaCdoBzNWL8T3cJmvHEKnuUrsRcBMPiDXIxCSz4gaRF6CkxLSyTCycRkVkhqXiqjoPIgQujU2iVH+qETbuiK6aUy2zKs19wcICIk+7CXbOzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DwQTpFoV; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DwQTpFoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791408672; bh=Ez4WqaNYCW4tKr4bQHDt31QSh4VBDGd5N/6Lg1cKTOY=;
	h=From:To:Cc:Subject:Date;
	b=DwQTpFoVn3pJxHQERT9vuY60C4is+fRSSucTuZMo6s3uR1R6u1H613LPhZD+9Ii+U
	 SkAj7NZhVC1TUu+xLWDIKdJM6lJ2jiE6CjbPjvehb2abwLb1JJtnxUO7X/7+EE6R7B
	 NqnOGtTqslh6sv1HGt138M1txaRM5ABw+9LGBDg0=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-XMAILINFO: MsFdwj3NHrWltKlVLC5kVvmqPLx6WKEbSGo0hC4RiFd1cW+2GUkdpGh4q4C+r9
	 TvFHTFu/jzV2I7C+v65GTxGxstak/kHkYR7CZS172gLKl9V8DXgnyXLrqrWVj+7subx1sqtJHIKA6
	 k33a8v4WfOoSkojK8oQ7Ebf8pO6OBP6EeUtJJb9ijp6kClpqjUrKdAktbWsYI82rJ/k91RZD8mviG
	 1v91Bqgb43mY5t/ZVUryZh5OSLbUVsfOE3u//3bpcaNvgW0uaOVVwjKSjukSlnbzgdnKXujNQG5if
	 VMM/bpkUUZmFT+/fQagncqbXINnuQMqexU6WfhkxtwamBx0Ck7oN76DJID1sjn2GRORw68GwagrFO
	 KBUYHYaBP7+QPtZv9n2SMc0aFQ7T4p2Maziiz6VWEHNHMxjZD3HuGzbieGgWHL8CEcUAl6Ryj633Y
	 ERmzF8Oie1l9H4UpwPJzBIKmo4Ooe6fUmdP4SOR59I9jdGIT20fUVHonMrTCiGGdAnUIwMIQ1g3MH
	 +G2KsMDhVlY4EMbdzX9nPqXZYhH2ul25nVOLgCAHU/jYjtv4B3vWVbJe78HMSLiEkSNTETOaiHv0J
	 GhdOF+yQmeQu5KBDsiW5me/ACdGQQjozMCTSs10V17cwgW6ELu9YbIv1JKTTfT/6QGF7z/lPKfCXv
	 3UvKKEhqpNOEVkdP5AqaU4qAuGIniyE/mf8v5E4uLPsDceqEMYzoRbWs+HH9piFfe3QlNKFcwjFGp
	 YbupALkTWVii2EJV6mvfzYOdyINhG4WPu971+UqPAPSPGTsETHsn+ElUMkegJoWfESFkzJ9lWcxsl
	 HfCfwACmbvP4hV1XRkeYJ/4htxw1Sh2tRUApoHtumT8zcy47QOO04qEoVVHZhA+1rh9zCwEUAqdIh
	 F4UH2U/IWZr8GYeKISEAdhfAFpB2oC7nYmxSLu5Iuu002E5tz20RFSAjyr5T4KTKSU5uxoyCy/zvv
	 K84L9QPfGCByyLyjeu+Gp+++hCOsI3iDy3V2LmWKgKg2i4va3fAbU5wPVpMcWLHXSRzFDUaLstkwU
	 hczn/R/e/EHhhwWVb4DPGf1CdLJ/y4CkZqTg0ZzM2VDrU6wnXAH9SZ1S3fQX7Zbc1f5i5k8+k5H6q
	 ZRc6R7FjNUIzkfB0y8JNniQsSqBSklcK5n8=
From: "=?utf-8?B?YmlmYW5na250?=" <bifangknt@qq.com>
To: "=?utf-8?B?V19Bcm1pbg==?=" <W_Armin@gmx.de>
Cc: "=?utf-8?B?cGxhdGZvcm0tZHJpdmVyLXg4Ng==?=" <platform-driver-x86@vger.kernel.org>
Subject: [Hardware support request] uniwill-laptop: MECHREVO Yilong15Pro GM5HG0A keyboard backlight
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 8 Oct 2026 05:31:10 +0800
X-Priority: 3
Message-ID: <tencent_36699D13D174660E0D76C4F5EFB825D86609@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmseza56-0t1791408670tnvm2qws0

SGVsbG8gQXJtaW4sCgoKSSB3b3VsZCBsaWtlIHRvIHJlcXVlc3Qga2V5Ym9hcmQgYmFja2xp
Z2h0IHN1cHBvcnQgZm9yIHRoZSBNRUNIUkVWTyBZaWxvbmcxNVBybyBHTTVIRzBBIGluIHRo
ZSB1bml3aWxsLWxhcHRvcCBkcml2ZXIuCgoKU3lzdGVtIGluZm9ybWF0aW9uOgotIERpc3Ry
aWJ1dGlvbjogRmVkb3JhIDQ0IEtERQotIFJ1bm5pbmcga2VybmVsOiA3LjIuOC0yMDAuZmM0
NC54ODZfNjQKLSBETUkgc3lzdGVtIHZlbmRvcjogTUVDSFJFVk8KLSBETUkgcHJvZHVjdCBu
YW1lOiBZaWxvbmcxNVBybyBTZXJpZXMgR001SEcwQQotIERNSSBib2FyZCBuYW1lOiBHTTVI
RzBBCi0gQklPUyB2ZXJzaW9uOiBOLjEuMDlNUk8xOQoKCldpdGggdGhlIHN0b2NrIEZlZG9y
YSBrZXJuZWwsIG5vIGtleWJvYXJkIGJhY2tsaWdodCBMRUQgZGV2aWNlIGlzIGV4cG9zZWQg
dW5kZXIgL3N5cy9jbGFzcy9sZWRzLy4KS0RFIGRpc3BsYXlzIGEga2V5Ym9hcmQgYmFja2xp
Z2h0IHNsaWRlciB3aXRoICJuYW4lIiBhbmQgY2Fubm90IGNvbnRyb2wgdGhlIGJhY2tsaWdo
dC4KCgpJIGNoZWNrZWQgdGhlIHVuaXdpbGwtbGFwdG9wIERNSSB0YWJsZSBpbiB2Ny4zLXJj
NiBhbmQgY291bGQgbm90IGZpbmQgYW4gZW50cnkgbWF0Y2hpbmcgdGhpcyBtYWNoaW5lLgoK
ClRoZSBtYWNoaW5lIGV4cG9zZXMgdGhlIElOT1UwMDAwIEFDUEkgZGV2aWNlIGF0IFxfU0Jf
LklOT1UuCkEgcmVhZC1vbmx5IHByb2JlIHVzaW5nIGl0cyBFQ1JSIG1ldGhvZCByZXR1cm5l
ZDoKCgpQUk9KRUNUX0lEIMKgKDB4MDc0MCkgPSAweDE5CkFQX09FTSDCoCDCoCDCoCgweDA3
NDEpID0gMHg4MApTVVBQT1JUXzIgwqAgKDB4MDc2NikgPSAweDk0ClJHQl9SRUQgwqAgwqAg
KDB4MDc2OSkgPSAweDAwClJHQl9HUkVFTiDCoCAoMHgwNzZhKSA9IDB4MzIKUkdCX0JMVUUg
wqAgwqAoMHgwNzZiKSA9IDB4MzIKQklPU19PRU1fMiDCoCgweDA3ODIpID0gMHgxOApLQkRf
U1RBVFVTIMKgKDB4MDc4YykgPSAweDAwCgoKSSB0aGVuIHRlc3RlZCBhIHNtYWxsIG91dC1v
Zi10cmVlIG1vZHVsZSBsaW1pdGVkIHRvIGtleWJvYXJkIGJhY2tsaWdodCBjb250cm9sLCB1
c2luZyB0aGUgRUMgcmVnaXN0ZXIgbGF5b3V0IGZyb20gdGhlIHVwc3RyZWFtIGRyaXZlciB0
aHJvdWdoIHRoZSBFQ1JSL0VDUlcgQUNQSSBtZXRob2RzLgoKCkl0IHN1Y2Nlc3NmdWxseSB0
dXJuZWQgb24gdGhlIGJhY2tsaWdodCBhbmQgZXhwb3NlZCBhIG11bHRpY29sb3IgTEVEIGRl
dmljZSB3aXRoIHRoZSBmb2xsb3dpbmcgdmFsdWVzOgoKCmJyaWdodG5lc3M9MQptYXhfYnJp
Z2h0bmVzcz00Cm11bHRpX2ludGVuc2l0eT0wIDUwIDUwCgoKS0RFIHN1YnNlcXVlbnRseSBk
aXNwbGF5ZWQgdGhlIGJyaWdodG5lc3MgY29ycmVjdGx5IGFuZCBjb3VsZCBjb250cm9sIHRo
ZSBrZXlib2FyZCBiYWNrbGlnaHQuCgoKVGhpcyBjb25maXJtcyB0aGF0IHRoZSBiYWNrbGln
aHQgY2FuIGJlIGNvbnRyb2xsZWQgdXNpbmcgdGhpcyBFQyBpbnRlcmZhY2UuCkhvd2V2ZXIs
IEkgaGF2ZSBub3QgdGVzdGVkIHRoZSBjb21wbGV0ZSB1cHN0cmVhbSB1bml3aWxsLWxhcHRv
cCBkcml2ZXIgd2l0aCBhIERNSSBlbnRyeSBhZGRlZCwgb3IgaXRzIG90aGVyIGZlYXR1cmVz
IHN1Y2ggYXMgZmFuIGFuZCBwb3dlciBjb250cm9scy4KU3VzcGVuZC9yZXN1bWUgaGFuZGxp
bmcgb2YgdGhlIGJhY2tsaWdodCBoYXMgbm90IGJlZW4gdGVzdGVkIGVpdGhlci4KCgpDb3Vs
ZCBzdXBwb3J0IGZvciB0aGlzIG1vZGVsIGJlIGFkZGVkPwpQbGVhc2UgbGV0IG1lIGtub3cg
d2hpY2ggYWRkaXRpb25hbCBkaWFnbm9zdGljcyBvciB0ZXN0cyB3b3VsZCBiZSB1c2VmdWwu
CkkgY2FuIHByb3ZpZGUgdGhlIHByb2JlIGFuZCB0ZW1wb3JhcnkgYmFja2xpZ2h0IG1vZHVs
ZSBzb3VyY2VzIGlmIG5lZWRlZC4KCgpUaGFuayB5b3UuCgo=

