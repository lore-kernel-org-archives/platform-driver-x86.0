Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210791E4AF;
	Wed, 29 Apr 2026 21:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777499426; cv=none; b=GyymxxcN4/Fj32azEIkHoJfiI/WbYcZwdRYfLnsDsDwRI94tIRLsfV49ARdM4HvFbgnzepODzEKWgIgrTamQ9wUUFWsaCP4g5Esv8wIphaU8UsMrw/eYfC0wRXBw/D9j0x6qFvbAI2hN2wyr1b5q997im/htRqIJZBdYCrIRt9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777499426; c=relaxed/simple;
	bh=bY7Jx8XWTMN5k10K+yAOt/XrQeXq8ha0hyhTlmjD8yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a397e1im7nZRs9DEMsTuOtMktus7KNadqT+X2znDzPH8mjQvSnssKToswflDmxOZyxU/bPeY5bj35fjL+FvaOWqQnxWYmVF98qmyqVKru4VD3JV0noj/SQMbZWsjjUtVXYGNLkNoGVAqcRGZTbI8TmXcBmpFrF+qB4OJYeVNMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PKpxrZVA; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PKpxrZVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777499267; x=1778104067; i=w_armin@gmx.de;
	bh=AGRMleAS8KenNkq2Jcv5HSTX832eTJ/4PWZSxvk4sBY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PKpxrZVAt3f33YXWuF68T9BxUmpFGAVaBRCS/YUujjbnT2bCGlJoydeXqLfVyRql
	 MK3If4cqQbwiEdLciBBjjV3G0nIupPhgykurHr8SOrmlKwuqRlVY69kz31XWGo7fG
	 ZBXzjpmy8xneMG1/7u9MxZLUciDYdfZMJn/oLRx5q2VDIqgYX3h/9OU225qfRYvaS
	 XYj2/7/bxpSfxO5IvYANC3+UPTLYQ++ggxEfYxYBCAR51vdX8uTtGL4W/hKLTbdKB
	 XyBLZb2yqpMD//lnAoOx9lnK8ykYMJc5BKyum2JhqPAfDp9ns4Z4rnOuIeQugKLnV
	 jjZrjdHLlwlS734ppg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp9i-1vqZdn0qZo-00OmOT; Wed, 29
 Apr 2026 23:47:47 +0200
Message-ID: <824480ce-99d3-437f-bcae-ad2a1f286803@gmx.de>
Date: Wed, 29 Apr 2026 23:47:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/wmi: Fix unchecked min_size in
 wmidev_invoke_method()
To: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260429-invoke-fix-v1-1-ce938eb80cd3@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260429-invoke-fix-v1-1-ce938eb80cd3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cvxv6WH557ppxNTenTIAidyYrAEKDbuyZNp1/kCKJaPTqdWC88D
 gHmVPXTxUgd8UPreKQdMqMXm59ikICXs9+E1eUhzQsgcpW5oOI2ty/FP+auTFsEuTUw3L6i
 BFZua5S/v9mL9tcg71BDjq4Ahn0C8Nav0cwOsJ1LFy2GXNp6W/q1PWZ5ILkNbGQeXQtR3Ep
 TNhzkJFy86NTpZbtpZKQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:idS8ewq/Qq8=;g4hZUBQORD8t6ygCalLTH1rYCIn
 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
 wW6kDzrx6u+IA6jRHa/IrEAGD8riEe3SYvZc=

Am 29.04.26 um 15:20 schrieb Kurt Borja:

> After calling wmidev_evaluate_method(), if the ACPI core does not return
> an out object, then wmidev_invoke_method() bypasses the min_size check
> and returns 0. Add a check for min_size if there is not an out object.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Fixes: 1aeded2f55f0 ("platform/wmi: Extend wmidev_query_block() to rejec=
t undersized data")
> Closes: https://sashiko.dev/#/patchset/20260406203237.2970-1-W_Armin%40g=
mx.de
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/wmi/core.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 7aa40dab6145..5a2ffcbab6af 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -411,6 +411,9 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8=
 instance, u32 method_id,
>  =20
>   	obj =3D aout.pointer;
>   	if (!obj) {
> +		if (min_size !=3D 0)
> +			return -ENOMSG;
> +
>   		out->length =3D 0;
>   		out->data =3D ZERO_SIZE_PTR;
>  =20
>
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260429-invoke-fix-44f026f90c56
>
