Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159773451A7;
	Mon, 22 Jun 2026 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163387; cv=none; b=E4ErcRRns974EoPI6RK8q0gclXgRGHEqGCZZzopPUtXXKLi8SFSg3DSJ19LOFixcfgyhRzBVCZy/Wea0G52e53rhujKsNsWIe9RKhpdmXhMOG5TqzHDOeDZG1AUVcxiYPLwfulPHq4a7SXsQv7dpmgpMuv60OAWvOebPivlhvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163387; c=relaxed/simple;
	bh=rbz64xrNVGTIdMF1fbwFaFQpyvd0zTQytWiQDP505oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TssHst4ZgMn1K41niKUcCnlToVPNgQ8TCyTUZwbn9AUNbL0RrJ9bMZUtQMDtXEI+1blMTCbx8PyNyjLzN1nBnrZzqDIL5s31OHtCjtlKhl+0798iu9H4G199RDORIpuWXGQ7wqwLPLLZ+W5d/HxETryYNs+eiGQRsuxb5CJQpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AjTQgZLT; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AjTQgZLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782163380; x=1782768180; i=w_armin@gmx.de;
	bh=T3jNxy0GoSTNuZO9ymtkkN0ehzTdM5Q+8h4dZcFNHPk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AjTQgZLTIX4rwbQxWQQnIkNM3gesSMa4yCQGqmqkeRpnFVyQ0IGO9jLUf+tqFhm4
	 q82XMnP4HrIOvvkASrfPtMq0c/uVbX0OUAO+evHvCmEiqmDJmb2dQdhPVaPH38QHV
	 PcQXUy0UtbyU13Y6HwEOxVQXWPc+iPLy1R+BFuKHmJsE62kwHA+fm7tz/ZuQ9tdrC
	 sW7G2du+LqQjnKaMCyJDA1DHJqDgN/Wb7MM8YYM8T/0pz4MPWsCUhzD9P2Q7m//Tj
	 KLCDF+DfMuBjErhXbeJQ1RLR5DZFKtSKKDOa/KPmew9nGTR0WlZNhbHzf+M0vdL+5
	 KFr/4sYHbqjDJhxkZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MO9zH-1wmap31emX-00NIbh; Mon, 22
 Jun 2026 23:23:00 +0200
Message-ID: <db81ecfc-9c7b-408c-9f65-6f1f77bf5eef@gmx.de>
Date: Mon, 22 Jun 2026 23:22:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86: bitland-mifs-wmi: Fix NULL pointer
 dereference during suspend/resume
To: Mingyou Chen <qby140326@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260620081805.63773-1-qby140326@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260620081805.63773-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yq1VNT6p5Fnf36JtuqPn4fObFfAuVKJFQGG23Bs9UrHsjvCLM6J
 0c+UrEkpO1LpkdY5uuTSHaTZ1hqsijqLxPOzYZDuQM0qYXyBvVHPPvfZXLg4q62fV0eydzG
 L4c0pRZXpb/MAYeNGpHw/Jc/DxrMa6CQN5pUiVjiBeAW9/FbOxdRUw6Uhd4GobuuJGFjmyg
 L/bzPpmUkuJnKSTchCUMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KdxB5rNaW+w=;/3HlICGCdFDGjFBjXIyP3e1ixSE
 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
 yv9CqEJ+aX3/yQPi5E=

Am 20.06.26 um 10:18 schrieb Mingyou Chen:

> The driver registers two distinct WMI devices: a control device
> (BITLAND_WMI_CONTROL) and an event device (BITLAND_WMI_EVENT). During
> the probe phase, the event device handling path returns early before
> initializing the platform profile device (data->pp_dev), leaving it
> NULL.
>
> However, the PM sleep operations are registered globally for the WMI
> driver
> and are triggered for both devices. When entering suspend, the event
> device
> invokes bitland_mifs_wmi_suspend(), which passes the uninitialized
> data->pp_dev (NULL) into laptop_profile_get(). This leads to a NULL
> pointer
> dereference inside dev_get_drvdata(), causing a kernel Oops and halting
> the
> suspend sequence.
>
> Fix this by adding a validity check for data->pp_dev in both the suspend
> and resume callbacks, safely skipping profile operations for the event
> device.

Hi,

very good catch, i totally missed this during the initial review xd.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>   drivers/platform/x86/bitland-mifs-wmi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/=
x86/bitland-mifs-wmi.c
> index b0d06a80e89e..3a373184519d 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -300,6 +300,10 @@ static int bitland_mifs_wmi_suspend(struct device *=
dev)
>   	enum platform_profile_option profile;
>   	int ret;
>  =20
> +	/* Skip event device */
> +	if (!data->pp_dev)
> +		return 0;
> +
>   	ret =3D laptop_profile_get(data->pp_dev, &profile);
>   	if (ret =3D=3D 0)
>   		data->saved_profile =3D profile;
> @@ -311,6 +315,10 @@ static int bitland_mifs_wmi_resume(struct device *d=
ev)
>   {
>   	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
>  =20
> +	/* Skip event device */
> +	if (!data->pp_dev)
> +		return 0;
> +
>   	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile)=
;
>   	return laptop_profile_set(dev, data->saved_profile);
>   }
>
> base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
