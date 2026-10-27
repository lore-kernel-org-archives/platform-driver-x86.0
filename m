Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118196;
	b=cQQnj5wMxM5+LeeX8CPHMPSSvhDw73IOmrghUAp49yOJIWL1tT63RzsoLc2UuLkGAWK+
	 Uyn1RiANdMTLVopUWrIZtEq9tLfd/eBL45llrmap6fSE5wgFkvOxtWwVzpjDfcT9uDhDr
	 3MAAh0nbE2B8rDYf7Zp+szIVkAIHHwOj2k0Ui2HJgG2iTzmcsGHbyqUE0aw6DX/Bae2PF
	 edHuk6gapJipva8wXJzjVLOmi2oroxaCpU/2Ejpt2p/pvvw4DuykPVGwEC0iD1O36bGhb
	 dfkAVxXWpuvLMZR2AZ/sM0TNCT79SHGuyTLhHlFESuQxgLTGKkVTKrJhsbXLxKK9ntw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
	b=GyrCKWBAA3eWgv5Miwn9jqVK5EWZ6Gy04GTf4BLdEX9LtjafthPV1hv7yjxw0U3w2VKW
	 xGDeDpC02FVEyYzUAR23BkYXkNWIWc59dJqTZaDjJNlx8LhMMHV6CsetJ6wr4YZ7tsMqz
	 E6HldAE5+iatOmmckEAl1f7ByJP2y/eo2WjZnfpAjG8bejt8WaDrvcShjzy6kYtRVlwNr
	 DaIoewIKRdq3cxRflaH54LOrKCmb3m9tnXwHf26nYDYgAuzrp3ViYMDk7PwkxlN5i32E5
	 FNMpK27QCbkfBxc0+dVEqUzHOncU2dUEbiXi5d/7BU9pJ4k4CdZJvHs4KVtOD9+Xyhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMLfp17Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE4606A325
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 16:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AE4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMLfp17Q
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b09e07e149so39427867b3.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 09:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118195; cv=none;
        d=google.com; s=arc-20260327;
        b=iYBCbP30DHb9fi9ETWF1LjFPsGUTQTS791ar4x9cNXkSv+Fj+eePfo7PsCxefQj/yl
         U2pQJPVhCbheYr7rf9AFIrGYNKqtySSBZqj6MhvuhpZ8C17HRUNmHN8LZn9Rx/R3Ct8/
         lIe7vfHjCnwhRYMkVQQkeeptBZG4Fr9hOXUUrmr49/klIZuHtQ8Lv3W2jCpvGU9NTixE
         R+CMJY3hL1N6AltqywwujgOEd4tKo8ZH93luELQluQPZApdoG05ClDyn3ky1vEofaA8W
         7pe59+9MMi/HQC7BwpliwBedKVTNj5YQMmXIb8pHrtw/xsQFcDAs9Kkg3NqhCvPnSx0X
         RjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
        fh=MYg8Cq0hnv/88FEPfXzUlw18ruPkAkHZoHxwdhekGws=;
        b=KvhSasbZXQ9zU+RzNWNc2E/sOHgWsNVxLOEDxCwTm87ufuIqLvk1kojcGDaFQ0+nir
         /sFhIiz0V8NKl6QT6kacUtkKT10kEJTX23lWR9yNP8+9ioXFHuxOEiubZL2NXbzNlbPC
         TFFfUUTm1YPrhLtf9Lt9YlMOZfpBpAL9BrGMFU3yrTRnInwNsvN3Lv/iJc/aejnWTN4q
         e07PierqJMF02D/5nnozJufYczzioC9nL9acC0MsObfnWLqbsqxY85vNWprsO3txaJy5
         tAgD5gViKSw/XES8O+inWtyUcKGQykXejSs8H85bn0lY3+hbMbc8YBqwSDpPklDWyXf/
         +Kqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118195; x=1793722995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
        b=XMLfp17QWzpGE0tU5jJjiCFTB4/tY1R1uZXh/9tzKH+JZ1EpWJ2QbLXtbTP5cwypu+
         tjIq070JZMhQ919gl5zS3WzV7nfdO1KPWvuJshIa/S+dz2u21UtLNvpH1XhMuz+LdWb2
         ciFjQL4BVuyLd4nuJUjwOOSi0oDx+zOAqBAQaG1KQEYjkJVEtK6Hfc8abC/KkMp948cS
         i9hjseDoOIgABmGaDlV6goSmNfAAg8F+ZnolgHqGCyV3+Lzk8LVH2X3H+YCe2m+MwOD+
         JTgWPwbRaO3AtEm0hz0NtgmNtn6WOJvCLcztaHXonJiERv1QwlhudS2pPCeDvSQY3rIO
         vJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118195; x=1793722995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
        b=hsyLBNPDMUq9WAYRPHGPVNA2Hczk+T//So3bUSXKpzEqPiIPnvZUjBXC9qjicy1Wol
         aRh53NnPgWGhg5K0jB38oIaOjpFAkiq8H+aO317bE3p0kLvnDqb1G+LuGqsRWUzcevPZ
         vr7TdeIiZ57HPCSZtTv1Esguwr8S10OJhh8g2/I0G/K5q3CJTzWaCPTylzURfSb1O6xt
         bPoHP2hEfG1+ZXUx2AgdmXOq12cliMoHEE8GGaf49gnPxDFVsISj7wZBgWoOUq4u/vYs
         mloZVkW1Qmx/9U4i4DZtZfRNBOlWM6WHhM4xfXBnb/sonZ/6ekyyAFoI623Cow7Wfwy2
         1UqA==
X-Forwarded-Encrypted: i=1; AKwUvBzK0cDKXcsXCQ3XGz6odovRi+MCxuJWNYazEdcI+/42ASAh6zuXMDj9Z93KVytUL83C+TzXtmuxQPmWnFHXYRdV/1P6@vger.kernel.org
X-Gm-Message-State: AFq9FYLQLn9wweIbyZocFLRf98TxB74cR0RW6mmNE85dtNwk6xUzAgj+
	xmLHoeDwDLGI+GtNY8F3BpgZFPnTRODyRfiARS30ZYYTXg3pUzOIzf/0227j50Zw3fw8ePfUTqz
	vM09ScVSq/R+1tv6ZrrXJRNIT/1Mxg94=
X-Gm-Gg: AYBFou1hSoK91mlmzBGGj6CO9mCQY4yW/Ik5+V21L1bHrMSDPozjh+ubSwvF1JFRYOA
	jsnbOn6I2gpBDEunAOcnltPN/PPNehddWxBzwfZCiP34GRyoCTlxiK3X9a4rkBZdCMX3nlwnkpz
	pWq6dXYsW9GJrLuBVdd0UR3WZGSoASTHSOqvv1Aldl6ioztds4R9d4CLccSRi3qUA1o1IPrkjb9
	vQuqGBC/FttGWFf0Ljhr1sw3bdg/IHHoHzeCYmfFGtoogBmcJf9R1fdMqyv6srC8Kk798z6Vj1s
	CORDDTHxjQDFTXhO0d+9ezhGXyKD5C8NELEeB6aDjIfD8jo/mtWUEXKkyM5UFZHU9kLK526O2Cm
	JbXPSzjFnbwdL6inUyjyJ8rrnhz6GfPZNTEiN
X-Received: by 2002:a05:690c:ec8:b0:8a9:977a:4149 with SMTP id
 00721157ae682-8b166c208dfmr65074317b3.72.1793118195377; Tue, 27 Oct 2026
 09:23:15 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026111103.4158855-1-lgs201920130244@gmail.com> <908cb70d-bfe8-4d01-b64e-44ffcfe259bd@kernel.org>
In-Reply-To: <908cb70d-bfe8-4d01-b64e-44ffcfe259bd@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:23:05 +0800
X-Gm-Features: AclHuK-tuXfD3-wCV2DoM9fPtRqDwLKmCfP8tZLuO8Qr1rY1uRTJcYQ15eNQu_Q
Message-ID: <CANUHTR9XrH5gKF=bN0s7Z2xP=5OzPEU8D8_Xwv4F+3rp2cUS-A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: fix UAF after accelerometer
 registration failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Garrett <mjg@redhat.com>, Marek Vasut <marex@denx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 26/10/2026 12:11, Guangshuo Li wrote:
> > When input_register_device() fails in acer_wmi_accel_setup(), the error
> > path frees acer_wmi_accel_dev but leaves the global pointer non-NULL.
> >
> > Since acer_wmi_init() ignores the accelerometer setup failure and
> > continues initialization, a later driver removal or initialization
> > failure can call input_unregister_device() on the dangling pointer,
> > resulting in a use-after-free.
> >
> > Set acer_wmi_accel_dev to NULL after freeing it so that the cleanup
> > paths do not attempt to unregister the already-freed input device.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> So you just keep ignoring and ignoring our feedback. It's just bot, so
> little point to discuss with bot.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
