Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237A35F165
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 04:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691303; cv=none; b=KM+MQl6USSCPmcUicon0gkVenOU7dSfw8KlXi8oorRVzw6c5cdN1YDeak8PqfoW6vy9vxeXyO1Xt/ajaU/3qB1T3BNjPON/2bh/ubOGZ2AUNZ3yaoVAY50uVBHqxW3E/bl6f9na80LbsnU7Hb5C/5z0qKCA/2FlQvjRW85Wap6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691303; c=relaxed/simple;
	bh=4Z83Dd0KZW7MX1m8oV85pfbmhexkK2/nFAET4Hqj2LQ=;
	h=From:To:Cc:Subject:Mime-Version:Content-Type:Date:Message-ID:
	 References:In-Reply-To; b=EqfK/VJ/JQsZUoA0Jy+Ongr3zEzf6qM/EyDl8yMhjO5xdKehy1t8VLiFCEQZg4COlOjVptGILYpHWsSkjvVwwNQOSc9WupQCrf8yC9cYqGAvZwQv67KVKBmWH/tHnbvehhM/a0t/0WLhXk/Vmy6ZOxpCIKme6j5133GkphJpM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=aqOPTYNw; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="aqOPTYNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791691291; bh=4Z83Dd0KZW7MX1m8oV85pfbmhexkK2/nFAET4Hqj2LQ=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=aqOPTYNwoI5RHCRmzd2JezQsY4957lIs5BJSIEUbhrga254SXLoISQ7ROnp9ilAuB
	 Fn8dPsdl3fztEjDaurEhWJzXhY375f6hPsCqQe6CSo7PszpZIok1ery4mkz1O4a5XV
	 l98yPmVyWtfV5e2tug1+dRSkenAPgUUEpfdZPGQ0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: N55iztL8edgQGuikIW7JRy+DyPTN0Hfqmmi4XdUy1a6S2DZaub21Rs7l9fwTAR
	 DqZ2jHGmfIFZ1j6JSfcLydp8ew3Um1KF+oxetP4FRNPfoDgZFqgYrjpJwO/G0rkgaQzFU/l3jiTH2
	 7h13Mggpwq3N3UucR7D3xiBeWKvTZ2gTGyBBHzkv4FRoMSQQtEUbYy4VuEMRdTZN7x9xIIAOC9fkj
	 4OgwoYhUNS32qekR7/aT2Ku6B1KQbsv0VSUgSdKde/HWhQV4kApbkraeLJoJjO26c+I4ZX7NAoy8Y
	 wNSNq+PagIDqSucj1zVISzXN2z0mPgSE96YZRoDZv7xF1xl8bDmTUYiIASZl09f1XiV+sniVYBQR3
	 PSvk3KUn1oFky0fw9TkDqs/+iVMD/sJKk6Oj1aeSXkg9/k1GPBgnVO9MNPERoZX6jGVzHdqJr4lgh
	 cDb0eeaSeghmY8iIhxcJRjqr6qy06uhC1qqiIpHEg7y4G21E1ZXg9O2/w+tivKURupoXNJv4TTu/z
	 GpuTDezJZfqoPIKwgdKNtpphl7rCErypIBkFaGwQh/16qydJI/IjMiwt68IO5x28+kRHcm77VFUMG
	 kC96OiXugnPRTzbdCPp8Jkv2BiPIpCef8BhfYq5AR4ygxd2wUo+pEds/sEtnhg9kJ2DK1qdJ5NZwX
	 O84pXpoLa9D+RhnnjOHu1cM9Cc3rYlAPEDnRMTTN23bfzrSy7cwSU8417w1iYQo4tfaYF6gt6AWJD
	 Oa7tNIKhnzp4NZqpSjqqtpluP77r5rWp5Dk3E5N2C0zE0oTSSbXVKMZ0LV0ETGvRHTCga9Tzb/EgU
	 i3TCNugG8ypbCZwVOgOunnDkA0D+a9YDxULNHXMAvZiZRmmTMDwfs63wpYpv4EJTZFkgaqoibAZNO
	 Ykczr7VhrJQ/l14OBFviuzah66iAZjkd7/1o7tUVHuEmEErEApLJFmzBvdFjjMOS6KWiZEuWyJq2h
	 Gm20h/hq3cDgysDG2eHe0MkGeqyJhFuNMNEG+C/WEPxbWEyFyMJ524gwHBF0v/U4Pnf+W0l6pLgXX
	 1iSiJ7wINU/p4JwZIUIicLskybICLPLMXyZ5Q/3z5U72AuPSA+vN2tg45UpgfFBi2132DdDz5KiCU
	 0OE26mKa2K2inA==
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
Date: Sun, 11 Oct 2026 12:01:29 +0800
X-Priority: 3
Message-ID: <tencent_8D0E2B7612F49BB973D94868D7129175D809@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_B151EE01B6705AB1C44E1D81C38D9D4C7D07@qq.com>
 <750f97be-7d45-41b1-84e2-3fbb9229f602@gmx.de>
 <tencent_EAAEE9BC1F36ECF8E88372E7B025D0AA270A@qq.com>
	<1720cd41-9685-4edf-9653-511c396b2302@gmx.de>
In-Reply-To: <1720cd41-9685-4edf-9653-511c396b2302@gmx.de>
X-QQ-mid: xmseub15-2t1791691289thwk0k67e

SGVsbG8gQXJtaW4sCgpUaGFuayB5b3UgZm9yIGNoZWNraW5nIHRoZSBBQ1BJIHRhYmxlcyBh
bmQgcHJlcGFyaW5nIHRoZSBwYXRjaC4KSSBhcHByZWNpYXRlIHlvdXIgaGVscCBpbiBnZXR0
aW5nIHRoaXMgbWFjaGluZSBzdXBwb3J0ZWQgdXBzdHJlYW0uCgpPbmUgc21hbGwgY2xhcmlm
aWNhdGlvbiBhYm91dCBteSBuYW1lOiBJIHByZXZpb3VzbHkgc2lnbmVkIG15IGVtYWlscyBh
cyAiYmlmYW5nIiwgYnV0IEkgd291bGQgcHJlZmVyIHRvIHVzZSAiQmkgRmFuZyIgZm9yIGF0
dHJpYnV0aW9uLgoKVGhpcyBpcyBteSBmaXJzdCBpbnZvbHZlbWVudCBpbiBMaW51eCBrZXJu
ZWwgZGV2ZWxvcG1lbnQsIGFuZCBJIHdvdWxkIGJlIGdyYXRlZnVsIGlmIG15IHJlcG9ydGlu
ZyBhbmQgdGVzdGluZyBjb3VsZCBiZSBhY2tub3dsZWRnZWQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIGZvciB0aGUgcGF0Y2ggYWRkaW5nIHN1cHBvcnQgZm9yIHRoaXMgbW9kZWwsIHdoZXJl
IGFwcHJvcHJpYXRlLgpZb3UgaGF2ZSBteSBwZXJtaXNzaW9uIHRvIHVzZSB0aGUgZm9sbG93
aW5nIHRhZ3M6CgpSZXBvcnRlZC1ieTogQmkgRmFuZyA8YmlmYW5na250QHFxLmNvbT4KVGVz
dGVkLWJ5OiBCaSBGYW5nIDxiaWZhbmdrbnRAcXEuY29tPgoKVGhlIFRlc3RlZC1ieSB0YWcg
cmVmZXJzIHRvIG15IHRlc3Rpbmcgb2YgdGhlIG1vZGlmaWVkIGRyaXZlciB5b3UgYXR0YWNo
ZWQsIGluY2x1ZGluZyBsb2FkaW5nIHdpdGhvdXQgZm9yY2UgYW5kIHdvcmtpbmcga2V5Ym9h
cmQgYmFja2xpZ2h0IGNvbnRyb2wuCkkgd291bGQgYWxzbyBiZSBoYXBweSB0byB0ZXN0IHRo
ZSBmaW5hbCBwYXRjaCBpZiB5b3UgbmVlZCBmdXJ0aGVyIGNvbmZpcm1hdGlvbi4KClRoYW5r
IHlvdSBhZ2FpbiBmb3IgeW91ciB0aW1lIGFuZCBndWlkYW5jZS4KCkJlc3QgcmVnYXJkcywK
QmkgRmFuZw==

