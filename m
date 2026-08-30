Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E493B2FF7;
	Sun, 30 Aug 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091153; cv=none; b=QJKBoGoueyZCoBjOh7b/8ei/v32PoKIyxI815/u10hhbj54HiCxwqzQ2ByQIZ2rn/fdEE1usIQQXwMPQvTKQjqkuQlRPvOeM9nyKaSAQLL4SO3eSaPBqoFVfbhxJlYCDjkpAeaYNYvHW0SlryADvrDu1JecYp4Rp1dGpPCsJIR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091153; c=relaxed/simple;
	bh=e6WAB/+lIYO7N27v5+AWnrik/PxpYHceqPeHTwgJoyM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=IfA47n92I8oyIIYx69lSwLzr1iSvJ6DblfBjvZUIkv7lkUar2FvKF6BMFlpmRJ+TzbbouvBKzWyMXYiJKhYYOsKu2ZRgel6PYq+Fjvv49Qro23HneeKuCNMi1Bqr7LVdqJlNc5dRilPxzrs6euPvZhzliSeuZ31U7CHQaLe9KPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UMrB7fwW; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UMrB7fwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788091130; x=1788695930; i=w_armin@gmx.de;
	bh=e6WAB/+lIYO7N27v5+AWnrik/PxpYHceqPeHTwgJoyM=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UMrB7fwWiv2Gn8ZrjW5eftS3zswyXEy+wev5UQM36sqH90yn2SjNEScxGDuHpr1Y
	 KGt9RkuFldiggJF6SGrh7pE0B3cBvrPROtLqPZl9OrrRz29ILq8SMVCKh1Cwfm5Ib
	 zU96kvlfOOTQ4bAIWHT4o5uGu19+KoGauZPCCc9zG1mPWRHNv/54YBNW3Zr2tyxAq
	 vDWhFj9HGa0rddwWkL401SiE+87oveWlG/Uhmvw/jwDRDuBryBc262RGqCz8fmVsZ
	 3Bl4JCBUICASKWtXwq/S0hYpwkNB8ixUzDLT6iBulKFCLIfS7Epou1a3FViVkkQsO
	 4MysSMnr9RP84B4uUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6lpM-1wxsE02eIo-000eGR; Sun, 30
 Aug 2026 13:58:50 +0200
Content-Type: multipart/mixed; boundary="------------TJfJ6Ov7FFoDHUudAnDhftQu"
Message-ID: <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
Date: Sun, 30 Aug 2026 13:58:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler
 directly")
To: Salvatore Bonaccorso <carnil@debian.org>, Jun MO <royclark086@gmail.com>,
 1146124@bugs.debian.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Denis Benato <denis.benato@linux.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178807922598.807847.18300931641658404390@eldamar.lan>
X-Provags-ID: V03:K1:O9eCqGIc5Ng1WzDjISt+pBAWYJrO6FLL1tkw8Wlf5IU2aHUOuZl
 PI2I9JiFQPpZy4sVLY951i5tu0qMCL5pxHXk4o9IZXM+dTxcBEgfFs8+h7BbOjZYGrBMUjk
 JyPgYz6t3q3STUX2ouH5GKB3J1ta8gFS46QkRQSvlNvex7gN/h4KyVbdOfbHgQxJiLtrXns
 lvQHax3S8uhHbi2w9L41w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wDbEyiJWeVQ=;4E3oXB8ZuYrWz0L5Qj2GUTEIe1T
 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
 P332pSDxLWym001j9P9GCNTcDkQ==

This is a multi-part message in MIME format.
--------------TJfJ6Ov7FFoDHUudAnDhftQu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 30.08.26 um 10:42 schrieb Salvatore Bonaccorso:

> Control: forwarded -1 https://lore.kernel.org/regressions/178807922598.807847.18300931641658404390@eldamar.lan
> Control: tags -1 + upstream
>
> Hi
>
> In Debian, in https://bugs.debian.org/1146124, Jun Mo, reported the
> following, with a bisection result:
>
> On Sun, Aug 30, 2026 at 12:59:45PM +0800, Jun MO wrote:
>> Dear Maintainer,
>>
>> Fn hotkeys on Lenovo ThinkPad SL400, which are supported by the
>> module asus-laptop, no longer work starting from Linux 7.1. Normally
>> when those keys/key combinations are pressed,
>> acpi_listen/kacpimon/"evtest
>> /dev/input/by-path/platform-asus_laptop-event" will capture related
>> events, for example:
>>
>> $ acpi_listen
>> ^[[1;2Photkey ATK0101:00 00000032 00000000
>> button/mute MUTE 00000080 00000000 K
>> ^C
>>
>> Starting from Linux 7.1, there are not any related event captured by those command.
>>
>> Using snapshot.debian.org, I found out that the last working kernel version is 7.0.14-1 while the first not working version is 7.1~rc2-1~exp1.
>>
>> Following instructions in [1] and using /boot/config-7.0.14+deb14-amd64, a bisect resulted in:
>>
>> git bisect start
>> # status: waiting for both 'good' and 'bad' commits
>> # good: [458c6079fc1d41d564c37679c8ace02cd83ee817] Linux 7.0.14
>> git bisect good 458c6079fc1d41d564c37679c8ace02cd83ee817
>> # status: waiting for 'bad' commit, 1 'good' commit known
>> # bad: [7fd2df204f342fc17d1a0bfcd474b24232fb0f32] Linux 7.1-rc2
>> git bisect bad 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
>> # good: [028ef9c96e96197026887c0f092424679298aae8] Linux 7.0
>> git bisect good 028ef9c96e96197026887c0f092424679298aae8
>> # good: [334fbe734e687404f346eba7d5d96ed2b44d35ab] Merge tag 'mm-stable-2026-04-13-21-45' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>> git bisect good 334fbe734e687404f346eba7d5d96ed2b44d35ab
>> # good: [cdd4dc3aebeab43a72ce0bc2b5bab6f0a80b97a5] Merge tag 'ntfs-for-7.1-rc1-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs
>> git bisect good cdd4dc3aebeab43a72ce0bc2b5bab6f0a80b97a5
>> # bad: [beaba8bfbb91e3bb3133eacacd62fd6fea515e34] Merge tag 'probes-v7.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
>> git bisect bad beaba8bfbb91e3bb3133eacacd62fd6fea515e34
>> # good: [bea8d77e45a8b77f2beca1affc9aa7ed28f39b17] Merge tag 'staging-7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
>> git bisect good bea8d77e45a8b77f2beca1affc9aa7ed28f39b17
>> # bad: [065c4e67cc2c40e6dd94649e8e720096fbabd4ee] Merge tag 'uml-for-7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
>> git bisect bad 065c4e67cc2c40e6dd94649e8e720096fbabd4ee
>> # good: [4b0b946019e7376752456380b67e54eea2f10a7c] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
>> git bisect good 4b0b946019e7376752456380b67e54eea2f10a7c
>> # bad: [d6116d86e58a04a9522e349c4a27145521c01ad7] platform/x86: int3472: Use local variable for LED struct access
>> git bisect bad d6116d86e58a04a9522e349c4a27145521c01ad7
>> # good: [19ebacfb442b83aa5fe75f9c6851b4edbfff3760] platform/x86: dell/dell-rbtn: Convert ACPI driver to a platform one
>> git bisect good 19ebacfb442b83aa5fe75f9c6851b4edbfff3760
>> # bad: [378500dc1313e2c06a2f675bb00ab5d7880433ba] platform/x86: asus-laptop: Register ACPI notify handler directly
>> git bisect bad 378500dc1313e2c06a2f675bb00ab5d7880433ba
>> # good: [03ae0a0d0973b9e584a05136aab08fee2ef8e455] platform/x86: uniwill-laptop: Implement USB-C power priority setting
>> git bisect good 03ae0a0d0973b9e584a05136aab08fee2ef8e455
>> # good: [b0bcf48c74cc7f72d1b6effc7cecdae871b1785e] platform/x86: toshiba_acpi: Register ACPI notify handler directly
>> git bisect good b0bcf48c74cc7f72d1b6effc7cecdae871b1785e
>> # good: [553b2ac59fbb434330287fde0cabc64bc6f11ceb] platform/x86: toshiba_bluetooth: Convert ACPI driver to a platform one
>> git bisect good 553b2ac59fbb434330287fde0cabc64bc6f11ceb
>> # good: [3a96c7915d93231e128df74901fe8fcb960b0ecb] platform/x86: toshiba_haps: Convert ACPI driver to a platform one
>> git bisect good 3a96c7915d93231e128df74901fe8fcb960b0ecb
>> # first 'bad' commit: [378500dc1313e2c06a2f675bb00ab5d7880433ba] platform/x86: asus-laptop: Register ACPI notify handler directly
>>
>> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1143721#15
> #regzbot introduced: 378500dc1313e2c06a2f675bb00ab5d7880433ba
> #regzbot link: https://bugs.debian.org/1146124
>
> Does this rings a bell?

I think i found the culprit, could you please test the attached patch?

Thanks,
Armin Wolf

>
> Regards,
> Salvatore
>
--------------TJfJ6Ov7FFoDHUudAnDhftQu
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-asus-laptop-Fix-ACPI-event-handling.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-asus-laptop-Fix-ACPI-event-handling.patch"
Content-Transfer-Encoding: base64

RnJvbSBjMzU2OTRkMjcxODRkYWJlMzE2NzI2MDhiOGFlMDY4OGU2NjcxODI0IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogU3VuLCAzMCBBdWcgMjAyNiAxMzo1Mzo0MCArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4NjogYXN1cy1sYXB0b3A6IEZpeCBBQ1BJIGV2ZW50IGhhbmRsaW5nCgpUaGUg
ZXZlbnQgY29kZXMgaW5zaWRlIGFzdXNfa2V5bWFwW10gc3BhbiBhIHdpZGUgcmFuZ2UgZnJv
bSAweDAyCnRpbGwgMHhDNSwgYnV0IHVzaW5nIEFDUElfREVWSUNFX05PVElGWSBwcmV2ZW50
cyB1cyBmcm9tIHJlY2VpdmluZwpldmVudCBjb2RlcyBiZWxvdyAweDgwLgoKRml4IHRoaXMg
YnkgdXNpbmcgQUNQSV9BTExfTk9USUZZIGluc3RlYWQuCgpGaXhlczogMzc4NTAwZGMxMzEz
ICgicGxhdGZvcm0veDg2OiBhc3VzLWxhcHRvcDogUmVnaXN0ZXIgQUNQSSBub3RpZnkgaGFu
ZGxlciBkaXJlY3RseSIpClNpZ25lZC1vZmYtYnk6IEFybWluIFdvbGYgPFdfQXJtaW5AZ214
LmRlPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtbGFwdG9wLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLWxhcHRvcC5jIGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvYXN1cy1sYXB0b3AuYwppbmRleCA0NDlhZGRkMWFjN2EuLmNmZmZmZThiYjIz
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy1sYXB0b3AuYworKysg
Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLWxhcHRvcC5jCkBAIC0xODgyLDcgKzE4ODIs
NyBAQCBzdGF0aWMgaW50IGFzdXNfYWNwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCWlmIChyZXN1bHQgJiYgcmVzdWx0ICE9IC1FTk9ERVYpCiAJCWdvdG8gZmFp
bF9wZWdhX3Jma2lsbDsKIAotCXJlc3VsdCA9IGFjcGlfZGV2X2luc3RhbGxfbm90aWZ5X2hh
bmRsZXIoZGV2aWNlLCBBQ1BJX0RFVklDRV9OT1RJRlksCisJcmVzdWx0ID0gYWNwaV9kZXZf
aW5zdGFsbF9ub3RpZnlfaGFuZGxlcihkZXZpY2UsIEFDUElfQUxMX05PVElGWSwKIAkJCQkJ
CSBhc3VzX2FjcGlfbm90aWZ5LCBhc3VzKTsKIAlpZiAocmVzdWx0KQogCQlnb3RvIGZhaWxf
cGVnYV9yZmtpbGw7Ci0tIAoyLjM5LjUKCg==

--------------TJfJ6Ov7FFoDHUudAnDhftQu--
