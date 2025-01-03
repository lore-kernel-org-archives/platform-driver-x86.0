Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A819E999;
	Fri,  3 Jan 2025 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938493; cv=none; b=emXBclcdaTn6V4zKwQOqzBkaK+Lo0CwlIjtWfZmFdPwKPCMQvTcIplAUIjC/97+b3WIU7CJA11j0BFgh5IhxIbvqjHRqOyec5gT0fs0nAfyBdGFO94/twJY2/r/+TZyI90Useixr87lRLwK/PM+q134Tg/AmG6Ska/jqg3kUQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938493; c=relaxed/simple;
	bh=rmSNYZNt1QP7f9WvqWeenpCgQ4z24vyEIO+iSKmbgmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ysw3SP/UDxzL3VPTR7ltpx57Bd7OAFcagVr2uB3XioM5XqJ/W8VALA6QcY2RHMyLmzMYUr9IrdcKj3EGpfh7Ak1rhk9zlrmaRGRei9rg6crDODgjLu3nklMuOEguSc9Zuj6Gg/cFv/0DpvS27ZYlORdXYQpTNQpW4mNMm3HP+10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JtwpwC84; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JtwpwC84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735938479; x=1736543279; i=w_armin@gmx.de;
	bh=St6bYbe0GhzimhIitI6+ghakJdLb+KK176PKHlbnGFY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JtwpwC84PBAJlpYGiKMdXoWH7HKjH3gu229uMVQgvCpbW5wA+UVNocbUyi3T9EOj
	 FaVawNQUURh5JKfDT79E9hwtzTKYh3e8/GLpN5qjotHScO6l7ACjwyY65oWESUwZ7
	 b0ueLL703e5YmMacYyDx3y4+fqpu74gBe/UYOuiTwuB3cN4NEWjcz36SML571OKqi
	 hiq6XYpgx2rO4xGI3jMFUqX8pwJBiOCe5Xa0Q42KHlD6eEvjFRRfY7gELl8kwO3Vg
	 a7y4YCcH11LGxnCeEXU99IUb9OnaIx3lF4ZP3hXSroUaclWTV1v8Xg2WFv4VouZbP
	 njRytQMbyfubmJRDNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1u07FS1BYr-00dlnr; Fri, 03
 Jan 2025 22:07:59 +0100
Message-ID: <20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de>
Date: Fri, 3 Jan 2025 22:07:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
To: Hridesh MG <hridesh699@gmail.com>, Kurt Borja <kuurtb@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, onenowy@gmail.com
References: <20241231140442.10076-1-hridesh699@gmail.com>
 <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
 <CALiyAon3r=VXFNZw7is4VWZoRnFFbrUUvLB9XeW+xkMLjXDyRA@mail.gmail.com>
 <tftomtw456sevajiid76bgenmxl2s5ycv4sckfgl7mdjbs5hxb@5vs36lxjtaxc>
 <CALiyAokg_-Mc2R_OL03AF32=EPcFS1+RYoA9G6r8iJj9ZEMtmA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAokg_-Mc2R_OL03AF32=EPcFS1+RYoA9G6r8iJj9ZEMtmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CLjjf58dcyUoWSsdo3/X3JFaiSSbvpBfH1tteRUty1Y9MlrMOZf
 T1V4FslQgDNntOD2StcLnWme2CzeAaJCjFtzRzJVJCRxkDEkYPrBIf0ccwTuS1o4j+8Jm4u
 FImFDS6DGqW5AKvdMh6zy9oXVm7F+M0YpNqlzsmSQzPaan03oJybuj/6/iMxNrHQtqSLgEr
 S4u370E4NEk9JauP8O98w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QQbYiTLPT/4=;MOKfaKB/snhIhijOKKsV7/vKLkG
 HDB7+ohPxidHvNoydcxEH2YfW9snPuI0OIsv0xFCMcnS+qTPx2iMdx8RUHEQleifpqfR2vJdk
 hFD6W5lV2+65HswflWROttp+3TXczsGo1oaXn+GPXwENsYB+fXR/M6IBEKELNTCqqhwk0QOFZ
 gwYvIKsWUmjCHJn6p/mfRJtokcaSBsL9ZDL94+PUBHKmmruqX8e0xkFFDftGu7UeNfOPRZ2/G
 BExUdlLSmlB9cU+AjGpCkedVOIuYkGcGbDHiUxvZ9GTNXIstrdr7tlSixOCdG5qDd2ao7VDP7
 XRVcAg/vT5Ajqj1SZbYCczLbaB7GLnkyE7Q1QkeUvU2GaMBWCmik4OkdJoivdvr7oPOjPetCL
 AUDP+HNGbaXVQcYwt3Ne38qkCemPyedSKLTaf917FRhcqWHvFvui7BDLE2CfiRj8C+IXr35dW
 8FSQfHBmdif8TrxtKSa454qgkVMW5wdGIe3VmkVe/l4HFSIZlP90FCjShqyV3kYt2qRayDAgn
 es0u7Pxa/PzCl9E56VHnE6dYLrGy9a2sfR7GwZwfLFodancpZNJWk5PA/vr29XWPSotlpyLL6
 9zBJpSimyjfcubZaj4ZGqGaehi/upGo6yqPbvfjbnG4L3Ekc/0Cy8MFVx+U2eiwAI0T5Lg16I
 bdZK7wEwPUtA++J9NmWniX6LkAxcrDzAX0eklSIrlfyujXcEkHAuUGaTHP6ArVyvPhZfMow9W
 ZLaQTUI5zEUih5XRugo42TlYrcd6JbZNY+l73YRWx/XqXLfi+7cRpubKcW4slFPiUMtvVaqOt
 285Z20f1XqfDALJ4y2S0jxkiSSi+UWVnJhRryk8o6qIZDhGlHp2FRNW8uJRQIsBnARTUG50zP
 mnDTaKFCNdOX1SUsX3p7LAJoo7UbhkosOVBsZPmHjUYBepGYTDIOA0cvw0PmfEdrxiRq6JGMl
 zk0PNikWKGxBqES1E8X8TIGekXUFMWFhUa5aZZxpC/2unuduWSx27toOawlDXTZ+ShGDSVgS6
 M0bkxtsQe5UL00vRLQ4UGuL366Ye3l6J/ABCll4SJo73sYQpznxQtjY4Nou3dpdTrDueGUSRX
 wCz5hXKv/G4sh75V44E+tklNBYpmVl

Am 03.01.25 um 20:52 schrieb Hridesh MG:

>> Do you perhaps know if users expect a thermal profile change on AC
>> connect/disconnect events on Windows? This would solve this discussion
>> [1].
> Yep, there is a profile change on AC disconnect on Windows.
> Specifically, it forces the balanced platform profile and returns to
> the last active profile on replugging (the UI disallows changing of
> profiles when disconnected but it is possible via WMI)
>
>>  From my testing, what I've found out is that even if we don't handle
>> on_AC, the profile is still set but the hardware will not put the
>> changes into effect until we plug in AC.
> I did some more testing and I was a bit mistaken in the way it works.
> While the system is unplugged it will still apply the three different
> profiles (as evident by the differing fan speeds) but the CPU will
> aggressively throttle under stress, placing an upper limit on the
> maximum clock rate, this limit is lifted upon plugging in AC.

That is some very important information right here. The platform-profile documentation states:

	"Specifically when selecting a high performance profile the actual achieved
	 performance may be limited by various factors such as: the heat generated
	 by other components, room temperature, free air flow at the bottom of a
	 laptop, etc. It is explicitly NOT a goal of this API to let userspace know
	 about any sub-optimal conditions which are impeding reaching the requested
	 performance level."

I think the AC handling is unnecessary in this case as the hardware seems to accept different profiles
even when not running on AC. This would simplify the platform profile cycling inside the driver and
allow us to use platform_profile_cycle().

I wonder if this special behavior of the acer-wmi driver is documented somewhere. I am asking this since
this has a great potential to confuse users.

Thanks,
Armin Wolf

>
> --
> Thanks,
> Hridesh MG
