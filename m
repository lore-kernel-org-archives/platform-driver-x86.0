Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC2811CA9
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784467900; cv=none; b=kpiXwSWu/FhoKhb91STY2uIt7K9iPzQKv4KSd/wg5Zfd4Iee6IH/lfIZKSGmMyZl9ERk+1TS1Wh9SEF+zQxoCFJ7VezZZTIKLAW8lqafuT4AUprS7xiJd24eLtjgAlxkZFRL1QYRusYwZ/6L5GCCfBINQfxiPJ5SyTzYPNHiXwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784467900; c=relaxed/simple;
	bh=st/8ASXi2vJ/02u0NIJjU5ymuio3RyyJv1hmQRYf7mM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EDyfnqWfp+uOgnvQk2SOB/SBu6zZojZ8zaniqwr/zP858RimuoZnomxd0eTL6mFphJw28xCWqNLLyJ+uE85ma6gd1aUko4oXO2t6bvaWhYDVUVhS7YtSzFTvDI/qq/5D+X5VqLTyrluqnqWFvT/Ne4rS+hNiKmxWUfpOaCFkzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vigCZAGa; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vigCZAGa"
Message-ID: <9048aa8d-6453-4f16-b45c-570125380045@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784467895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ueRuiVy8k5OVyX0JubLZKkMNrlKN2sqmoChW8Uv7yw=;
	b=vigCZAGapPL+XVSbDtA107AGO9VDYowCZnAr2yBxcUHo7IDXqAinu3exnUcAXbO+nYfTBE
	Dq53GgcRz1VLmP6YyuMmsUh+FLg620XI+2EG9GOHJEogwhEoQ1FXt5fhKSEVl3Epv3EoQ4
	CuSodPaXtpXAuL7uwhjJcI/59ahaXtI=
Date: Sun, 19 Jul 2026 15:31:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ProArt key (0x8b) to
 KEY_PROG3
To: Nizar Al-Kabbani <nizar.m.kabbani@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260719090843.66777-1-nizar.m.kabbani@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260719090843.66777-1-nizar.m.kabbani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/19/26 11:08, Nizar Al-Kabbani wrote:
> The dedicated "ProArt" key on the ASUS ProArt PX13 (HN7306) emits ASUS
> WMI event code 0x8b. This code is absent from the asus-nb-wmi sparse
> keymap, so pressing the key only produces a "Unknown key code 0x8b"
> message and does nothing in userspace.
>
> On this model the key is exposed solely through the WMI interface and has
> no HID scancode, so it can only be handled inside asus-nb-wmi. Map 0x8b
> to KEY_PROG3 so the key emits a bindable event, consistent with the
> existing KEY_PROG3 mapping used for the ASUS programmable/Armoury key.
Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Nizar Al-Kabbani <nizar.m.kabbani@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 8005c08..aeb461b 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -632,6 +632,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x86, { KEY_PROG1 } }, /* MyASUS Key */
>  	{ KE_KEY, 0x88, { KEY_RFKILL  } }, /* Radio Toggle Key */
>  	{ KE_KEY, 0x8A, { KEY_PROG1 } }, /* Color enhancement mode */
> +	{ KE_KEY, 0x8B, { KEY_PROG3 } }, /* ProArt key (PX13/HN7306) */
>  	{ KE_KEY, 0x8C, { KEY_SWITCHVIDEOMODE } }, /* SDSP DVI only */
>  	{ KE_KEY, 0x8D, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + DVI */
>  	{ KE_KEY, 0x8E, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + DVI */
