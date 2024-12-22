Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF7A25771
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734902411; cv=none; b=kF+/KnznMRsdGc7n4xcG5UkFgWQX8JhWf3h/7ZX88m/NTTxieczhRHponq/gcJHneSZfjvGp3y53CEBIv6zfv4/v6uktd2UnrW/7T+t/5riaBVrrw8ebFum36EL1POJqVVK3aoc7NTPZ5+qZnvKXt1Q/lSWTWd2GNNIK9tVim2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734902411; c=relaxed/simple;
	bh=F+IWbFjNfUP559WcZYg5EwA1W03I5dgTSVZLwqzSM0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EbYepeAbWpHoxqj0BlK06fBCg4VX+rmbo7EZJODINHT3AbRmhwE/uBytyFGInCnbapGi4wsoEYUMfpEEZTIPow/8camhUgvY0ZWLYJbPGV3pFk11bMx/O0Zdfrn4Lg3L5RXf5wJrkGBbBL1Da764TerzTf23628JNgDjLsvEKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oUVVafvR; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oUVVafvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734902404; x=1735507204; i=w_armin@gmx.de;
	bh=F+IWbFjNfUP559WcZYg5EwA1W03I5dgTSVZLwqzSM0E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oUVVafvRMaXvotyAJf4khJnji7ybsXfZMStMV2rs4WHca6YBb7Slx08auLfUesf5
	 QR7yLoh8T5fFx14lOyg1D3GwDYmX8EyKi1BZueAyzD7oEjcka9dwPMs2QmgBHSoLH
	 UKpacDil1LZjxrgnwlyyQyNNFPuFx3vX6XtqqIPy9Z9Rnj6Tr2zAMcsq3fa63dUtt
	 QCdoLXTi/Q7CmX+GpylwMzbgO7Ip2i1H4wCDK5DHfzxSUyz6rasb597RdkJnkRPE+
	 rxWECuUfag6ENhx6C4FKG3NNuQCUNsKcLhAnbvINMMg4dMJI1OMk+iEj1QZdpEA7V
	 GA6mwkFv28FOhWNFnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGNC-1t9awX31gk-00K5mX; Sun, 22
 Dec 2024 22:20:03 +0100
Message-ID: <bc3db910-419d-48f9-ae8a-f29c81e066fb@gmx.de>
Date: Sun, 22 Dec 2024 22:20:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hotkeys disabled on Asus H7606 platform in hardware on bootup
To: Stuart Balfour <sbalfour@att.net>, platform-driver-x86@vger.kernel.org
References: <17FA8854-F3C7-473E-B8FA-E0C818531552.ref@att.net>
 <17FA8854-F3C7-473E-B8FA-E0C818531552@att.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <17FA8854-F3C7-473E-B8FA-E0C818531552@att.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:4pZxi/Kc6xQ7IKqTITudpDUhvtMjWq+iFBTiB2gLyIycWae00gt
 Rd8bJhf+7CisAvurzFM7ycj3YgYmaAibmQjgWGfKRdPk/WWoIlpUqs28bipZSTpSUGQ9gt8
 RVQ1Qvl2RAUoosT+YQ1DdteK4mk2bLgq649YOMa1O3HNKoNkw24PXpxAdHLmazp3h4Kjekt
 HS52XDNIqgqdIS0Wlboag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D81dwUbNpnE=;BP614SjmvCLWWb4sZpWzT3hNlQN
 Ekm/x7KdiXzT3yu+u8IABbXXoyqgYlANnwIfYJT6/zR7QWjDCD8jplAYKsNIuPQ5TXrGzzCWw
 CK8c+/sPn6KYWpumX5YevyvugnybbxaYvc1hDPX9/l0DGsXbuVjT190D9fq5RZpenyc0FBCCq
 IVMQDlZBqoMKcqhMc0443I9XqBeZLtOh46j7AzXgVyxzGIyw87SFTd+eOVqjLqpdvlZcJtpUm
 NFirgNXITZPBWSy0dE/Jn/x9/ASXkKmWBFEBDdypK7Tlv7gYdsbWplVaxlKnVtiVSoiVAHCRR
 6Ns9xoqTdnwJxVLiDR+vvYGMzPdNjxXY3ONn6qmgvEMqiV+Wi1KLWz8cjZqavYGJPICo+9kRU
 KRoksp3xskHPLjAtOjzwUcPut5JPMerDDzlfnxRYkx3RmU9I+qeI+HWdnR1Y6bZxK/lOjVHNe
 n5sFcNrfT1IJqDvxStEULkUdS3ECsDeZlUqWfxD7nqQGshGm6GKUMfnmfVoiHcLkcxMirFX6E
 WuLWXlRqOSAWzrh285RlPXsNyKs7Lurv/YRRm32mlIFr4NjPaXKc4e+6Jmy3oh3IzYGNDUjcy
 hxLzqnE3L5cT3vRjU8tPUbo8ZgD+8wWFKoRBw1huRyydN0Cd9aKKuUujteR+J7KhTqMPkBcz5
 mIpai19TvCQzdGojnMxtRG/OZHRBLTuZLMldXZ0z9evJedcejzezwC7gEMdo0k6WrIN18DpUt
 mBjLr2GxwHJCOu7ypxZ2fLLlgHs1lAhZwHNVbt7Fm41E5lTqANOaIT1segnA+FCC6872X84D1
 IctAuO0ekJwaaNwLeMPHJMzr7ay8Qt8rp8jfvd7+ApEJ4NFd6SPWNJVi5UX826CDT1Ys2Y1kS
 kPZs88dCyxjYfHFXQSC0IfqtlCr2alBV5KwIbncjG+UzwGLpIxYjG2nftykDBmxUWqpLw+VYb
 Q+ip0IKVwHj2KwvTn9dLD/GERYH3nvX2Oi4sWHUrf2uH9kJfSSC39Ji53b2Za1CyFwnmaJN1K
 4NSAiNVkabrcTP0PzSOZwRLM0Vir2aHxEHlKwuK6vOYzwQ8I+jPeFVXfkjVQotQXcAUhJLxRF
 XsE46MUEusqIW3C0crVGJa7vYcY374

QW0gMjAuMTIuMjQgdW0gMjA6Mjggc2NocmllYiBTdHVhcnQgQmFsZm91cjoNCg0KPiBJIGhh
dmUgYW4gQXN1cyBQcm9hcnQgUDE2IG1vZGVsIEg3NjA2V1YgUnl6ZW4gbGFwdG9wLiBPbiBN
aW50IDIyLCBrZXJuZWwgNi4xMi4xIChidXQgbGF0ZXIga2VybmVscyBhcmUgc2ltaWxhcmx5
IGFmZmxpY3RlZCksIG9uIGJvb3R1cCB0aGUgaG90a2V5IGZ1bmN0aW9ucyBvZiBrZXlzIEYx
LUYxMiBhcmUgaW5hY2Nlc3NpYmxlLiBFdnRlc3QgZm9yIGV2ZW50NyAoaG90a2V5cykgc2hv
d3Mgbm8gZXZlbnRzIGdlbmVyYXRlZCBmb3Iga2V5IHByZXNzIGFuZCByZWxlYXNlIEYxLUYx
Mi4gRm5sb2NrIHRvZ2dsZSBGbitFU0MgaXMgaW5vcGVyYXRpdmUuIEZuK0Z4eCBpcyBzaW1p
bGFybHkgaW5vcGVyYXRpdmUuIFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhlIGhvdGtleXMgYXJl
IGRpc2FibGVkIGluIHRoZSBoYXJkd2FyZS4gVGhleSB3b3JrIG9uIFdpbmRvd3MgMTEgMjRI
Mi4gVGhlIHJlbGV2YW50IGRyaXZlcnMgdGhlcmUgYXJlIGNvbnRhaW5lZCBpbiB0aGUgQXN1
cyBwcm9wcmlldGFyeSBjcmFwd2FyZS4gSWYgeW91IGRvbuKAmXQgaW5zdGFsbCB0aGUgY3Jh
cHdhcmUsIG9yIHVuaW5zdGFsbCBpdCwgeW91IG1heSBub3QgaGF2ZSB3b3JraW5nIGhvdGtl
eXMuIE9uIExpbnV4LCBhbiB1bmRlZmluZWQgKGFzdXMtd21pLmgpIEFDUEkgZGV2aWNlIGlk
IGlzIGFzc29jaWF0ZWQgd2l0aCBob3RrZXlzIGFuZCB0aGF0IGRldmljZSBpcyB1bmRldGVj
dGlibGUgdG8gdGhlIHNvZnR3YXJlIC0gcXVlcnlpbmcgaXQgcmV0dXJucyBhIHByZXNlbmNl
IGJpdCBvZiDigJww4oCdLiAgSXQgZG9lcyBpbiBmYWN0IGV4aXN0IC0gaXQgdG9vayBtZSB3
ZWVrcyB0byBmaW5kIGl0IGluIHRoZSBEU0RULiBFdmVuIGV4cGVydHMgY291bGQgc3R1bXAg
dGhlaXIgdG9lcyBvbiB0aGlzIG9uZS4gVGhlIHB1dGF0aXZlIGRldmljZSBpZCBpcyAweDEw
MDAxMy4gQXN1cyByZWxlYXNlZCB0aGlzIHBsYXRmb3JtIG1pZC1BdWcuIDIwMjQuIEl04oCZ
cyBsaWtlbHkgb3RoZXIgbmV3ZXIgcGxhdGZvcm1zIGFyZSBzaW1pbGFybHkgYWZmbGljdGVk
Lg0KPg0KPiBJ4oCZbSBjbG9zZSB0byBhIHBhdGNoIGluIGFzdXMtd21pLmMsIGFkamFjZW50
IHRvIHRoZSByZWNlbnQgcGF0Y2ggZm9yIHRvZ2dsaW5nIHRoZSBPT0JFIGRldmljZSBkdXJp
bmcgZHJpdmVyIGluaXRpYWxpemF0aW9uLiBCdXQgdGhlIGRldmljZSB0aGlzIHRpbWUgY2Fu
bm90IGJlIGRldGVjdGVkLiBBIOKAnHNlY3JldOKAnSBkZXZpY2UuIEkgdGhpbmsgdGhpcyBm
aXggaXMgZ29pbmcgdG8gcmVxdWlyZSBhIGNoYW5nZSB0byB0aGUgQUNQSS4gUG9raW5nIGFu
IHVua25vd24gZGV2aWNlIGlzIGEgcmVjaXBlIGZvciB1bnByZWRpY3RhYmxlIGVmZmVjdHMu
IEZpcnN0IEkgbmVlZCB0byBnZXQgdGhpcyByZXBvcnRlZCBhcyBhIGJ1Zy4gV2hlcmUgd291
bGQgdGhhdCBiZT8gVGhlbiBob3cgZG8gd2UgZml4IHNvbWV0aGluZyB0aGF0IGFjdHVhbGx5
IHJlcXVpcmVzIGEgY3VzdG9tIHBsYXRmb3JtLXNwZWNpZmljIEFDUEk/DQo+DQo+IFRoYW5r
cyBmb3IgeW91ciBhdHRlbnRpb24uIEl04oCZcyBiZWVuIGEgbG9uZyBoYXVsIHRvIGdldCBo
ZXJlLg0KDQpIaSwNCg0KdGhlIGxhdGVzdCA2LjEyIHN0YWJsZSBrZXJuZWwgY29udGFpbnMg
YW4gaW1wb3J0YW50IGZpeCBmb3IgYXN1cy13bWkuIERpZCB5b3UgdGVzdCBpdD8NCg0KVGhh
bmtzLA0KQXJtaW4gV29sZg0KDQo=
