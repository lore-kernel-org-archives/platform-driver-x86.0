Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF6C29346F;
	Tue, 18 Nov 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463108; cv=none; b=udzC3sefngzUFQhDOaViGWHK4XyPDTLwJQ73WtChnMmr2yIH1Vn6j4X2ai9Zg0WGDBhluyER3fyiuOgJzgyLagdqNpbtVldDrx/Ad8+lxvE1RVzxA3OCODdqGSqH4uDeq6Z0j9uOrq4MU0a+Zz2y6GUDFrTjQRpEOtgeRfhRdOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463108; c=relaxed/simple;
	bh=t+5ZIGgArPERczH/PuX+kgXp5UZtI9UFfNB00NWCjuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TT7G8wlZadSaaqqHMpMwHRfumVhj8y/Ag0Fpiz1ENQrJNYV63JGX3sb3aLF7YXNH6V9+9ziRuufGrQpqhc3A7802rRz/+vfTejXUewWi92jhQT3OBPfFHR6453FWzFPfTJ6Nokqi3HmlxYWpq8Hbbt5a4meLcHv/Nc/S7LMeJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qw+ncsFW; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qw+ncsFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763463083; x=1764067883; i=w_armin@gmx.de;
	bh=7bGrOgqQbY5XmS4lZVn6su0O7PBofBS5m48yofVYbvs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qw+ncsFWQ7BNeKge9wbpDCcmzmqsFmWCHXqN+JDrICDIVxLIOnCTtBj4OxHdcrUp
	 vEAOtGye+9ybCTIzbsItz3e4SMWHuXxbeYuWKr2uQapGmCBQdUocRZSBSXyaVG9KF
	 NFnCKoDGOvD7+Ir6EQpx7mmFY5g0PvX0yIwJP+fosKz5KQXi6wqm8LchYOeHp0Eax
	 lpE2Vratd/smrhgPokE7JxXSlhknQRRAF+cXRXIrQcYFZOF2a2axIDpFTFhh+TTEb
	 LVHLRn7q92/BbfSPXZEHEEEGoeP3G/V1UFG0YnSKCBheCMT6Holkpx18uz4OoYk4f
	 hOvBV7rh5EwSXYZa5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.178]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3DNt-1vIGtq0AST-0017nb; Tue, 18
 Nov 2025 11:51:23 +0100
Message-ID: <90093af0-7226-4ec4-b528-d6a23ea30c88@gmx.de>
Date: Tue, 18 Nov 2025 11:51:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: Ignore backlight event
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: jlee@suse.com, Bugaddr@protonmail.com, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251117155938.3030-1-W_Armin@gmx.de>
 <176345348327.8636.1554023632757663812.b4-ty@linux.intel.com>
 <d4ce47e0-cae6-4410-a9b2-e2fce571d019@gmx.de>
 <904d27a8-fcfc-35fd-153e-7cb48cc1fe4c@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <904d27a8-fcfc-35fd-153e-7cb48cc1fe4c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X2DMg3AWFSeGPqlucSogLivP7odQRmGTWLLI9gkIjjzUiBIYhhq
 zEWT5/RdRJe1om7/hP7/WF7JSCHb8nX/1FBnzcPiIGSaFvwbCk5xjVNyCJ1/QQzOnTd7M3K
 jT23FO+/59iJm25bicO+ds4ItyftmryVjEi7q//LQiuiBv8yAIJ6aoNJvAcYxr1AeMTfi7M
 ubipu71Bn1geG8p+/48vQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LE9AE14o1Z4=;lLR36dxbpbS0jp3Cn1qfqnpK3dI
 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

Am 18.11.25 um 11:47 schrieb Ilpo J=C3=A4rvinen:

> On Tue, 18 Nov 2025, Armin Wolf wrote:
>
>> Am 18.11.25 um 09:11 schrieb Ilpo J=C3=A4rvinen:
>>
>>> On Mon, 17 Nov 2025 16:59:38 +0100, Armin Wolf wrote:
>>>
>>>> On the Acer Nitro AN515-58, the event 4 - 0 is send by the ACPI
>>>> firmware when the backlight up/down keys are pressed. Ignore this
>>>> event to avoid spamming the kernel log with error messages, as the
>>>> acpi-video driver already handles brightness up/down events.
>>>>
>>>>
>>> Thank you for your contribution, it has been applied to my local
>>> review-ilpo-fixes branch. Note it will show up in the public
>>> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
>>> local branch there, which might take a while.
>> Thank you. I just noticed that i made a slight error inside the patch
>> description:
>> Tested-by: Reported-by: Bugaddr<Bugaddr@protonmail.com>
>>
>> Could you fix that up inside your branch?
> Hi,
>
> Hmm, I didn't notice it myself but think b4 did change it as this is
> what I've in the commit 444a9256f8d106e08a6bc2dc8ef28a8699e4b3ba:
>
>      Reported-by: Bugaddr <Bugaddr@protonmail.com>
>      Closes: https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-ni=
tro-5-an515-58-fn-f10-keyboard-backlight-bug-on-linux/#wmi-interface-issue=
s
>      Tested-by: Bugaddr <Bugaddr@protonmail.com>
>      Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>      Link: https://patch.msgid.link/20251117155938.3030-1-W_Armin@gmx.de
>      Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>      Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>
> ?

Strange, but the tags are indeed correct. In this case no further action s=
eems to be necessary.

Thanks,
Armin Wolf

