Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F318E025
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 03:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430898; cv=none; b=Rejka1IvtFXhRffMuSiMVsZPAJuMSR8RCW8tIhcO5kA7WAuJWIENzf95D2RFCu5Fej7jSV57tgR25v4AOtibDh+fQPlp+KWrM1wP7rz366zR+5q8i33mPuQ0g+lVcsn2SooW1Qsvw3ocNDQ17mI0RQIRhpFY1Q9fjbCF1Je13JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430898; c=relaxed/simple;
	bh=PFp7O61Aa4JJbIqJLJcC6k31EXyHdzSQZt/p+qTluy8=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=hqNvS30gDmL6IDdKcyVYnetWlT+QCKjmMPYAmE24sLGQ1S1Qwil9yoC/46yPXLROXJuSNcEkKqRenX2D/INOdmvcZricj+7O2irNZlLbG5/7CYMIbRfWySeztCHp+jkk06XUhFQSbEtXzsDHHPJbEasLg3MTxxsXL6WeZzwvWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bUekck38; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bUekck38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791430890; bh=PFp7O61Aa4JJbIqJLJcC6k31EXyHdzSQZt/p+qTluy8=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=bUekck38B+rTNTcDsPG1u+4YKjeoMBc+ZvK9big5Af3g6NnLzm7jGQC3PakEEmiWZ
	 watIoh76AoMaOfxNFwr3Ho4sJSkD/1XactoUt6z2JaNQBs+sHyGb4eDu5AjVQ5i1EX
	 /o8I6DEQN/kMNtIhTMupqEolOk6GStdUSYbZWWX0=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-XMAILINFO: OLAC/xahmq2GKWKWMOzNNVtjKYH2VdNzDAfwVjduifPL/KYNfakJb+1A8Mc6Fv
	 mkqPxWqMEtA8ZPUrV+wspnt2tVaq7ywxjjrnsUL72cCueii1hJqcoCl6cz6IIM/YxfeUdFRKru563
	 KIeb6vqplJklwyzTEKReqbAJhz5hdVNa5AuXyMrZJJTXwt3b25mmW9ancHzZJ00rEsKuBFXqAWrwt
	 RZEGwylvhJuIoM3QJ/R42IHnFTY83kaIupFkqBUMuvlMSl2tPZSCgmgAtXppRjNAbDScPuNnq0Q+9
	 kIM4b6ktwmSYyM1e76aF8QDcdjkKHfjcDIzAWpy6x0cpV/dP6Xy7kAF0SK+Uxia536goJy6NLWhO4
	 HoLW5hTchDu6xqIKKO3QMSy+KVLcNXGFQVR8s2Lc5FUH0purTGMb6FZuSNHXIalD3GML8eLVlAEbt
	 vhT0+HfZrxHxHbXgF/qbjUun2DJzWl+oLSATgSCGfz+ThMTH/7e4T7jzlMhe9wTYcEHSqyB8x1sJK
	 stNKLV+G/sf4fFqgPJvJgkYBEZUr72wMYXWoHLJ/yJmSDbA7EbPMopTwwAjprGT5F9l++778oys6a
	 TTyDWjWihTVbwN3qCBT968aSGajGjV9VHDnFjkZSq7gtI/cek08GSkKGrhyh9QNGgzBTRECwoWAiy
	 ZFaIdxq/numGBT9cdlbXzv/jGjtMtuj8Wqpq8arz0WwgEy9wNcSmvMISc0xCjPZ+/1/xzARBtNr7G
	 7AsV9JNoCbmcoFBfx7h8JJUqPo1A1Dz97iceguTCPa3uP9FLzauQHQYkLhYtf4pC5gmBXq1ihRIYP
	 6Q4vP/9TeN5Je29VPTeSJ07Azu7clFdq8yu3SlvmGnScYL7p+QtcOEw0uDK6aVfZ3x7/p6vy7Jeb0
	 X2iasxm2Xbm6cbQEcf8cUOolHbHOdemYYfOEkLibHATakRHLoL+Rd+I6IxxGPf3hltRzyiweTrapY
	 lcxFU7a6mmUFTvJXJWgLtUaTVMbHHiEmHYhFhcbJRjkh1AFuDa+jReOERT20AkdwJkqfCAVSPOzTM
	 /WwplLdYGuOtU1tr6XpW+NxN2oBq+e5csWH7RiLZX/nbyB1WHQyegCkpsLwoss6SGShghWgBQA9Md
	 Ipo=
From: "=?utf-8?B?YmlmYW5na250?=" <bifangknt@qq.com>
To: "=?utf-8?B?QXJtaW4gV29sZg==?=" <W_Armin@gmx.de>
Cc: "=?utf-8?B?cGxhdGZvcm0tZHJpdmVyLXg4Ng==?=" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Hardware support request] uniwill-laptop: MECHREVO Yilong15Pro GM5HG0A keyboard backlight
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 8 Oct 2026 11:41:29 +0800
X-Priority: 3
Message-ID: <tencent_D521DAA244039DBFC3919D4EFD176E383607@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_36699D13D174660E0D76C4F5EFB825D86609@qq.com>
	<fdb4e182-d1e9-49d9-9870-1af7eb268b4e@gmx.de>
In-Reply-To: <fdb4e182-d1e9-49d9-9870-1af7eb268b4e@gmx.de>
X-QQ-mid: xmseza56-0t1791430889tmig3b5sp

SGVsbG8gQXJtaW4sCgpTb21lIGZvbGxvdy11cCBvYnNlcnZhdGlvbnMgZnJvbSB0aGUga2V5
Ym9hcmQgYmFja2xpZ2h0IHRlc3Rpbmc6CgpCcmlnaHRuZXNzOgoKQWZ0ZXIgbWFudWFsbHkg
bG9hZGluZyB0aGUgZHJpdmVyLCBLREUncyBzeXN0ZW0gdHJheSBpbml0aWFsbHkgY291bGQg
bm90IGFkanVzdCB0aGUga2V5Ym9hcmQgYnJpZ2h0bmVzcy4KQXQgdGhhdCBwb2ludCwgc3lz
ZnMgYW5kIFVQb3dlciBib3RoIHJlcG9ydGVkIGEgbWF4aW11bSBicmlnaHRuZXNzIG9mIDQs
IGJ1dCBQb3dlckRldmlsIHJlcG9ydGVkIDAuClBvd2VyRGV2aWwgaGFkIHN0YXJ0ZWQgYmVm
b3JlIHRoZSBkcml2ZXIgd2FzIGxvYWRlZC4KCkFmdGVyIHJlc3RhcnRpbmcgUG93ZXJEZXZp
bCwgaXRzIG1heGltdW0gYnJpZ2h0bmVzcyBiZWNhbWUgNC4KSSB0aGVuIGNvbmZpcm1lZCB0
aGF0IGJvdGggaXRzIEQtQnVzIGJyaWdodG5lc3MgY29udHJvbCBhbmQgdGhlIHN5c3RlbSB0
cmF5IHNsaWRlciB3b3JrZWQuClRoaXMgc3VnZ2VzdHMgYSBkZXNrdG9wIHN0YXRlLXJlZnJl
c2ggaXNzdWUgZm9sbG93aW5nIG1hbnVhbCBkcml2ZXIgbG9hZGluZy4KCkNvbG91ciBjb250
cm9sOgoKS0RFIGluaXRpYWxseSBoaWQgaXRzIGtleWJvYXJkIGNvbG91ciBvcHRpb24gYmVj
YXVzZSBLYW1lbGVvbiByZXBvcnRlZCB0aGUgZGV2aWNlIGFzIHVuc3VwcG9ydGVkLgpBZnRl
ciByZWxvYWRpbmcgS2FtZWxlb24gYW5kIHJlc3RhcnRpbmcgUGxhc21hIFNoZWxsLCB0aGUg
IkZvbGxvdyBhY2NlbnQgY29sb3IiIHN3aXRjaCBhcHBlYXJlZC4KV2l0aCB0aGUgaW5pdGlh
bCBhY2NlbnQgY29sb3VyLCB0aGUgc3dpdGNoIGRpZCBub3QgcmVwcm9kdWNlIHRoZSBleHBl
Y3RlZCBjb2xvdXIuCkthbWVsZW9uIHJlcG9ydHMgaXNFbmFibGVkPXRydWUgYW5kIGtleWJv
YXJkIGJyaWdodG5lc3MgaXMgNC4KVGhlIGFjY2VudCBjb2xvdXIgaXMgUkdCIDIzMyA1OCAx
NTQsIHdoaWxlIG11bHRpX21heF9pbnRlbnNpdHkgaXMgNTAgNTAgNTAuClRoZSBvYnNlcnZl
ZCBtdWx0aV9pbnRlbnNpdHkgaXMgNTAgNTAgNTAuCgpLYW1lbGVvbidzIDYuNy41IHN5c2Zz
IGJhY2tlbmQgd3JpdGVzIHRoZSAwLTI1NSBSR0IgY29tcG9uZW50cyBkaXJlY3RseSwgd2l0
aG91dCBzY2FsaW5nIHRvIG11bHRpX21heF9pbnRlbnNpdHkuClRoZSBvYnNlcnZlZCB2YWx1
ZXMgYXJlIGNvbnNpc3RlbnQgd2l0aCBhbGwgdGhyZWUgY29tcG9uZW50cyBiZWluZyBjbGFt
cGVkIHRvIDUwLgpJIHRoZW4gdGVzdGVkIGFuIGFjY2VudCBjb2xvdXIgd2l0aCBhbGwgUkdC
IGNvbXBvbmVudHMgd2l0aGluIDAtNTAuClRoZSBzYW1lIG51bWVyaWMgdmFsdWVzIGFwcGVh
cmVkIGluIG11bHRpX2ludGVuc2l0eSwgd2l0aG91dCByZXNjYWxpbmcsIGJ1dCB0aGUgdmlz
dWFsIGNvbG91ciBzdGlsbCBkaWQgbm90IG1hdGNoIHRoZSBkZXNrdG9wIGFjY2VudCBjb2xv
dXIuClRoaXMgY29uZmlybXMgdGhhdCB2YWx1ZXMgd2l0aGluIHJhbmdlIGFyZSBwYXNzZWQg
dGhyb3VnaCB1bmNoYW5nZWQ7IHZhbHVlcyBhYm92ZSB0aGUgY2hhbm5lbCBtYXhpbXVtIGFy
ZSBjbGFtcGVkLgpLYW1lbGVvbiBuZWVkcyB0byBzY2FsZSB0aGUgMC0yNTUgY29tcG9uZW50
cyB0byB0aGUgZGV2aWNlJ3MgMC01MCByYW5nZS4KVGhpcyBhcHBlYXJzIHRvIGJlIGEgdXNl
cnNwYWNlIGNvbG91ci1zY2FsaW5nIGlzc3VlLgoKSW4gUGxhc21hIDYuNy41LCB0aGlzIEdV
SSBvbmx5IG9mZmVycyBzeW5jaHJvbml6YXRpb24gd2l0aCB0aGUgZGVza3RvcCBhY2NlbnQg
Y29sb3VyLgpJdCBkb2VzIG5vdCBwcm92aWRlIGEgc2VwYXJhdGUgY29sb3VyIHBpY2tlciBm
b3IgdGhlIGtleWJvYXJkLgpJbmRlcGVuZGVudCBSR0IgY29sb3VycyB3b3JrIHRocm91Z2gg
dGhlIGRyaXZlcidzIHN5c2ZzIGludGVyZmFjZSwgYXMgdmVyaWZpZWQgYnkgdGhlIHJlZCwg
Z3JlZW4gYW5kIGJsdWUgdGVzdHMuClByb3ZpZGluZyBhIHNlcGFyYXRlIGNvbG91ciBwaWNr
ZXIgd291bGQgYmUgYSBLREUgR1VJIGZlYXR1cmUgcmVxdWVzdC4KClRoZXNlIGNoZWNrcyB1
c2VkIHRoZSBzYW1lIHY3LjMtcmM2IGRyaXZlciB3aXRoIGZvcmNlPTEuCktleWJvYXJkIGJy
aWdodG5lc3MgYW5kIGluZGVwZW5kZW50IFJHQiBjb250cm9sIHdvcmsgdGhyb3VnaCBzeXNm
cywgYW5kIGJyaWdodG5lc3MgY29udHJvbCBub3cgYWxzbyB3b3JrcyB0aHJvdWdoIEtERSdz
IHN5c3RlbSB0cmF5LgoKVGhhbmsgeW91LgpiaWZhbmc=

