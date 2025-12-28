Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1C824BD
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Dec 2025 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766954455; cv=none; b=KsV7IpJQlnzcNmX4Ds812FKMxgUzYVWRbNhBidOxWsECdxdcd1NcO/Hyzm6ec4BcP1P7q6Kmb/kYakWLUUoADhqq6ZhGv8onB0M4+Rnabd/UwqMLvHbWnhb/vUk2RrX+Ez+bTeAb0zrSAYoVBnlmbXCiB04zAConDJJy+Q7f+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766954455; c=relaxed/simple;
	bh=IJ089Fxri39l3vqjxUHx1TKNi3H9vupB6iIBbbGV330=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=kryuv59Aa17Mxz1tWMm9foUGs0YDuPNfSrbfDkigNc0xRASCswBqwQHAdrU4fkfhdaHXFtMZttMz5q6gCN91qctPfbfDQPCXZWXgbCKlDue9x7xTfuzXYnsc/NoR+X/tYCAxwA88gwAxk+Bz2vq48ULrst0PtkGqJ8oFnW+dP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LvLH7kuU; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LvLH7kuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766954451; x=1767559251; i=w_armin@gmx.de;
	bh=IJ089Fxri39l3vqjxUHx1TKNi3H9vupB6iIBbbGV330=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LvLH7kuUaWkn8Y9wwfD0zGzSrU+3cZOzF/Aoz4Hs8S3qC5vM7tgDFCUtwBRCUsxG
	 egBR/C1J4CeymuLjMA+hYqFzLNllDXzciAfNY2+xF+jzinfjQ5iQdgu2X0deqf4FZ
	 SPvTh5OzgL5lUuqgXlOBz5JUhN2lxfFj/9jhi6RhlZH6DvRz4UdAHzqEWR5a1eIyy
	 8MthpoSJsaROvWTxWunT+lWXkzWojEHK/Z4/oQz9ccLcn1rqgXNOBb7jbaBTu0J6J
	 dIvZvYGMCM4cZ3Xmbno7VLw2FVTEQyJbsFSokBLcKipmuOrCs4GZt3Btp97rf36Iz
	 IvIMJjlHs/1vQ1XDjg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([5.61.142.23]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1ML9yS-1vIyum35gQ-00PC7C; Sun, 28
 Dec 2025 21:40:50 +0100
Content-Type: multipart/mixed; boundary="------------sA2CcORMiJ4I4Emuoanahk7m"
Message-ID: <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de>
Date: Sun, 28 Dec 2025 21:40:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Pranay <pranaypawarofficial@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de>
 <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
X-Provags-ID: V03:K1:WqdO9E+rzTfR+hlfTi882K2ebG1RvHUh8mNhfg4cc+DFkozIcxG
 gIOLh5zbkkyAQ2/oEbbAnQUdD8cTcIj/Ypc83wLUCP0jF8rhUE5IeUoNLcGHLpeINPo28I3
 CjGhV1oiCZ1S7AAuU74dAj4V1h3E0sYjiAGT0+BLKgUyhIN6t/Uh0GcpJAuPlAgW33LAwYh
 cRKkAPfzkleK+tCBGiVmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GyLrAGKpcM4=;xBfYg43qO0I/8ppQF53rZq0lwGa
 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
 P/kyVl3zagDSKsa7PXf6

This is a multi-part message in MIME format.
--------------sA2CcORMiJ4I4Emuoanahk7m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 25.12.25 um 22:51 schrieb Pranay:

> Sure here you go, in attachments
>
> Thanks,
> Bugaddr

I attached an experimental patch that should whitelist fan control for you=
r model. Can you
test that fan control and the nitro button works?

Thanks,
Armin Wolf

>
> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wro=
te:
>> Am 24.12.25 um 20:40 schrieb Pranay:
>>
>>> Dear Maintainers,
>>>
>>> I am reporting a limitation in the acer-wmi driver regarding fan speed
>>> control on the Acer Nitro AN515-58.
>>>
>>> The Issue: On Windows, enabling "Performance" mode via NitroSense
>>> ramps the fans up to 7000+ RPM. On Linux, selecting the "Performance"
>>> platform profile boosts the CPU power correctly, but the fans remain
>>> capped at maximum 3500-4000 RPM.
>>>
>>> Observation: This laptop model lacks a physical "Turbo" button. though
>>> there is a nitrosense button which is useless in linux.
>>>
>>> I am requesting that support be added to fix the maximum fan speed sta=
te issue.
>> Sure thing, can you share the output of "acpidump" to i can whitelist y=
our model
>> for fan control?
>>
>> Thanks,
>> Armin Wolf
>>
>>> Best regards,
>>>
>>> bugaddr
>>>

--------------sA2CcORMiJ4I4Emuoanahk7m
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-acer-wmi-Extend-support-for-Acer-Nitro-.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-acer-wmi-Extend-support-for-Acer-Nitro-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBlMmVmZTMwOTRkODZiY2U5ZDBiZjZlNTU2OTUyZjE4ZTViMmRmNTEyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogU3VuLCAyOCBEZWMgMjAyNSAyMTozNjo0NCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4NjogYWNlci13bWk6IEV4dGVuZCBzdXBwb3J0IGZvciBBY2VyIE5pdHJvCiBB
TjUxNS01OAoKVE9ETwoKU2lnbmVkLW9mZi1ieTogQXJtaW4gV29sZiA8V19Bcm1pbkBnbXgu
ZGU+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS94ODYvYWNlci13bWkuYyB8IDEwICsrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hY2VyLXdtaS5jIGIvZHJpdmVycy9w
bGF0Zm9ybS94ODYvYWNlci13bWkuYwppbmRleCBiZjk3MzgxZmFmNTguLjUzMjc0MTI0ZDgx
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYWNlci13bWkuYworKysgYi9k
cml2ZXJzL3BsYXRmb3JtL3g4Ni9hY2VyLXdtaS5jCkBAIC00NTUsNiArNDU1LDE0IEBAIHN0
YXRpYyBzdHJ1Y3QgcXVpcmtfZW50cnkgcXVpcmtfYWNlcl90cmF2ZWxtYXRlXzI0OTAgPSB7
CiAJLm1haWxsZWQgPSAxLAogfTsKIAorc3RhdGljIHN0cnVjdCBxdWlya19lbnRyeSBxdWly
a19hY2VyX25pdHJvX2FuNTE1XzU4ID0geworCS50dXJibyA9IDEsCisJLmNwdV9mYW5zID0g
MSwKKwkuZ3B1X2ZhbnMgPSAxLAorCS5wcmVkYXRvcl92NCA9IDEsCisJLnB3bSA9IDEsCit9
OworCiBzdGF0aWMgc3RydWN0IHF1aXJrX2VudHJ5IHF1aXJrX2FjZXJfcHJlZGF0b3JfcGgz
MTVfNTMgPSB7CiAJLnR1cmJvID0gMSwKIAkuY3B1X2ZhbnMgPSAxLApAQCAtNjU1LDcgKzY2
Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBhY2VyX3F1aXJrc1td
IF9faW5pdGNvbnN0ID0gewogCQkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiQWNlciIp
LAogCQkJRE1JX01BVENIKERNSV9QUk9EVUNUX05BTUUsICJOaXRybyBBTjUxNS01OCIpLAog
CQl9LAotCQkuZHJpdmVyX2RhdGEgPSAmcXVpcmtfYWNlcl9wcmVkYXRvcl92NCwKKwkJLmRy
aXZlcl9kYXRhID0gJnF1aXJrX2FjZXJfbml0cm9fYW41MTVfNTgsCiAJfSwKIAl7CiAJCS5j
YWxsYmFjayA9IGRtaV9tYXRjaGVkLAotLSAKMi41Mi4wCgo=

--------------sA2CcORMiJ4I4Emuoanahk7m--
