Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD041E32A2;
	Sun, 28 Dec 2025 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766952972; cv=none; b=heC6Hmr3dx0lQsXO9M/3AapH/zyl/fbzbWJSCLHYFNtvjbI2oSw1G7/Zqmu7TZKKNqBz3YXr0gqsMBCdpKqt9C8GkUUl477wPuvjxh75LO+BAXG3EBolfH3ZLAAFPcswQ87V1rm4QjXYqv1qFN7BRVIOtvhBkTzdoUkYnx/OYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766952972; c=relaxed/simple;
	bh=8bGDrgUqHE9zF8grWbf/LSOFO+juDubwDwNuPLRW7DU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Z0PJc3baa44FkTMZziTnuvwxLUEdCsh2la7mIKdFWuixgBatmE6gQxeXBjmB2uFjB9sE2SWVO8fu5I7+cvEBUAxgVIDNwhonHLqfa3Y2/eCbKE4mdKEQqOnO28QRCUBvc4dgX1x3I1JXnt2+ktDtPsKAi0aaGLXe9RFxFCIwb1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VZGWz0Yd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VZGWz0Yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766952967; x=1767557767; i=w_armin@gmx.de;
	bh=tZ5T8rqDoruGc3plTIdA9Vrm6ahYddEGZhE5K+W2feI=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VZGWz0YdtohOCxsnqt5FqBOA/es2SRb5ArFeBphDNxbeaMxQH+6XHMpvryZ9gObL
	 cJAPYhCU6yFJwLXrvtqT1SU9BfxKM9HGUx2EKVNpQloC79Zo0zc97JUMW00Hjq6O/
	 NIeWbMTMVQmVadGj8VFtbeoEaxu/VIM4/lVQtwr+hrrXne19KWh6ofMccZkti9RFx
	 TbrXC7z23LGLwqZ4bTU+RVHMqLBFcnDf7Zu33Gk+bvGFKCIlxwtJUdkbil1fgVsFn
	 +k1n266KVfdIO8a02kUmne0G6MVwDtf6uLujZisZxpC09GoATykiA5+jguvM3mqNp
	 iQFH0nzB1lEoy24SmA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([5.61.142.23]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1vSMUs3zIi-00YWA1; Sun, 28
 Dec 2025 21:16:07 +0100
Content-Type: multipart/mixed; boundary="------------Nq0cKD28wHgaI0CFJNWs9yFy"
Message-ID: <c6f87174-8ab1-40ae-bf7d-601caee89784@gmx.de>
Date: Sun, 28 Dec 2025 21:16:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samsung-galaxybook writes to a int via a u8*
To: Gianni Ceccarelli <dakkar@thenautilus.net>,
 Joshua Grisham <josh@joshuagrisham.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251228115556.14362d66@thenautilus.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251228115556.14362d66@thenautilus.net>
X-Provags-ID: V03:K1:6NWfzC1nQX7aMhNZ9qDo9gWx/tjM1Zu2n4/u/9cFAMjJQc/2lm/
 3/TBDT2eQ4BARK6bOtk6rGtE0NLurWBuZ75nBoj41xAjnqKg/+ADxugdQhoZxc8537Mgc7D
 tbQfNs5lj3KTL8/e7c409frY+GMWTaM+srgkQ5pS7bqEK7gTssPK5H4q/PM7TkIDwdaYokT
 SO8rftUfQZRXgbot5Nd1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0njtdSrmXho=;f3YTgsajoLEgvr0aaOt/atNd2fD
 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
 so38aObZYEMXgsNUNP/NIcTIm0P86Dp+64eccx

This is a multi-part message in MIME format.
--------------Nq0cKD28wHgaI0CFJNWs9yFy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 28.12.25 um 12:55 schrieb Gianni Ceccarelli:

> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/dr=
ivers/platform/x86/samsung-galaxybook.c#n450
>
> `val->intval` is an int (see
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/in=
clude/linux/power_supply.h#n228
> ), so writing to it via a `u8*` produces weird results, for example:
>
>      $ cat /sys/class/power_supply/BAT1/charge_control_end_threshold
>      78497792
>      $ grep END_THRESHOLD /sys/class/power_supply/BAT1/uevent
>      POWER_SUPPLY_CHARGE_CONTROL_END_THRESHOLD=3D-962691840
>
> The least-significant byte of numbers values contains the expected
> value:
>
>      $ perl -E 'say 78497792 & 0xFF'
>      0
>      $ perl -E 'say -962691840 & 0xFF'
>      0
>
> even after changing the threshold:
>     =20
>      # echo 90 >
> /sys/class/power_supply/BAT1/charge_control_end_threshold $ cat
> /sys/class/power_supply/BAT1/charge_control_end_threshold 78497882
>      $ grep END_THRESHOLD /sys/class/power_supply/BAT1/uevent
>      POWER_SUPPLY_CHARGE_CONTROL_END_THRESHOLD=3D-966918822
>      $ perl -E 'say 78497882 & 0xFF'
>      90
>      $ perl -E 'say -966918822 & 0xFF'
>      90
>
> I guess the code could be changed to:
>
>      u8 byteval;
>      err =3D charge_control_end_threshold_acpi_get(galaxybook, &byteval)=
;
>      if (err)
>         return err;
>      val->intval =3D byteval;
>
> Hope this helps.
>
Thanks for your report, this pointer cast indeed seems to be the root caus=
e of the strange values
returned by charge_control_end_threshold. I attached a patch for you to te=
st that implements you suggestion.

Thanks,
Armin Wolf

--------------Nq0cKD28wHgaI0CFJNWs9yFy
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-samsung-galaxybook-Fix-problematic-poin.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-samsung-galaxybook-Fix-problematic-poin.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjZjQzOGY0MGM4ZTk1NGFmYWRkN2NiNGE2YzgwOGJmNTUwNzI1NjFiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogU3VuLCAyOCBEZWMgMjAyNSAyMTowMjoxOCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4Njogc2Ftc3VuZy1nYWxheHlib29rOiBGaXggcHJvYmxlbWF0aWMgcG9pbnRl
cgogY2FzdAoKQSB1c2VyIHJlcG9ydGVkIHRoYXQgcmVhZGluZyB0aGUgY2hhcmdlIHRocmVz
aG9sZCBvbiBoaXMgZGV2aWNlCnJlc3VsdHMgaW4gdmVyeSBzdHJhbmdlIHZhbHVlcyAobGlr
ZSA3ODQ5Nzc5MikgYmVpbmcgcmV0dXJuZWQuClRoZSByZWFzb24gZm9yIHRoaXMgc2VlbXMg
dG8gYmUgdGhlIGZhY3QgdGhhdCB0aGUgZHJpdmVyIGNhc3RzCnRoZSBpbnQgcG9pbnRlciB0
byBhbiB1OCBwb2ludGVyLCBsZWF2aW5nIHRoZSBsYXN0IDMgYnl0ZXMgb2YKdGhlIGRlc3Rp
bmF0aW9uIHVuaW5pdGlhbGl6ZWQuIEZpeCB0aGlzIGJ5IHVzaW5nIGEgdGVtcG9yYXJ5CnZh
cmlhYmxlIGluc3RlYWQuCgpGaXhlczogNTZmNTI5Y2U0MzcwICgicGxhdGZvcm0veDg2OiBz
YW1zdW5nLWdhbGF4eWJvb2s6IEFkZCBzYW1zdW5nLWdhbGF4eWJvb2sgZHJpdmVyIikKUmVw
b3J0ZWQtYnk6IEdpYW5uaSBDZWNjYXJlbGxpIDxkYWtrYXJAdGhlbmF1dGlsdXMubmV0PgpD
bG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BsYXRmb3JtLWRyaXZlci14ODYvMjAy
NTEyMjgxMTU1NTYuMTQzNjJkNjZAdGhlbmF1dGlsdXMubmV0LwpTaWduZWQtb2ZmLWJ5OiBB
cm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9z
YW1zdW5nLWdhbGF4eWJvb2suYyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxh
dGZvcm0veDg2L3NhbXN1bmctZ2FsYXh5Ym9vay5jIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYv
c2Ftc3VuZy1nYWxheHlib29rLmMKaW5kZXggM2MxM2UxM2Q0ODg1Li43NTVjYjgyYmRiNjAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L3NhbXN1bmctZ2FsYXh5Ym9vay5j
CisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L3NhbXN1bmctZ2FsYXh5Ym9vay5jCkBAIC00
NDIsMTIgKzQ0MiwxMyBAQCBzdGF0aWMgaW50IGdhbGF4eWJvb2tfYmF0dGVyeV9leHRfcHJv
cGVydHlfZ2V0KHN0cnVjdCBwb3dlcl9zdXBwbHkgKnBzeSwKIAkJCQkJICAgICAgIHVuaW9u
IHBvd2VyX3N1cHBseV9wcm9wdmFsICp2YWwpCiB7CiAJc3RydWN0IHNhbXN1bmdfZ2FsYXh5
Ym9vayAqZ2FsYXh5Ym9vayA9IGV4dF9kYXRhOworCXU4IHZhbHVlOwogCWludCBlcnI7CiAK
IAlpZiAocHNwICE9IFBPV0VSX1NVUFBMWV9QUk9QX0NIQVJHRV9DT05UUk9MX0VORF9USFJF
U0hPTEQpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JZXJyID0gY2hhcmdlX2NvbnRyb2xfZW5k
X3RocmVzaG9sZF9hY3BpX2dldChnYWxheHlib29rLCAodTggKikmdmFsLT5pbnR2YWwpOwor
CWVyciA9IGNoYXJnZV9jb250cm9sX2VuZF90aHJlc2hvbGRfYWNwaV9nZXQoZ2FsYXh5Ym9v
aywgJnZhbHVlKTsKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCkBAIC00NTUsOCArNDU2
LDEwIEBAIHN0YXRpYyBpbnQgZ2FsYXh5Ym9va19iYXR0ZXJ5X2V4dF9wcm9wZXJ0eV9nZXQo
c3RydWN0IHBvd2VyX3N1cHBseSAqcHN5LAogCSAqIGRldmljZSBzdG9yZXMgIm5vIGVuZCB0
aHJlc2hvbGQiIGFzIDAgaW5zdGVhZCBvZiAxMDA7CiAJICogaWYgZGV2aWNlIGhhcyAwLCBy
ZXBvcnQgMTAwCiAJICovCi0JaWYgKHZhbC0+aW50dmFsID09IDApCi0JCXZhbC0+aW50dmFs
ID0gMTAwOworCWlmICh2YWx1ZSA9PSAwKQorCQl2YWx1ZSA9IDEwMDsKKworCXZhbC0+aW50
dmFsID0gdmFsdWU7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuNTIuMAoK

--------------Nq0cKD28wHgaI0CFJNWs9yFy--
