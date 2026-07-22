Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A244457B3;
	Wed, 22 Jul 2026 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784745601; cv=none; b=tiM+NcMPLZr3KakGhDs5qqbSbHOmhBbYk+5kQVNJTGf9ZV6o2n3tqdpUQuZEWTiBB9TlP+xHqWw6QH8yxkI4maJ8i4j6IfqLfbdVRF0HaFh4d0dtetdG43cHgYHoBj0jOZjozbMSAljw/PIy6WR8hyeW+M5Ox4trg6NuF2lHEOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784745601; c=relaxed/simple;
	bh=BLpMUeK/XF8ElwgxWa3162bEIkuE5RYvT6c6AjbdSAQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oywd0ctXKg5cVz14DpLDjHXA3VWordxK2pRbpPSfQ04NJyIgRFf2mZ+T3i5iK6LWAy/DG+gLBI3Byga6X7YwFjwdMce9R9CUs5M4zTBtOsFcYfCq6XOluzCpVR0ieRGZ9e3KhryBm7tfIt/0tC45pfkkxSoOuLsqJbcbAWcDHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=FJLgy+lI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VG1I3xKs; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="FJLgy+lI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VG1I3xKs"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 0EB681D000FA;
	Wed, 22 Jul 2026 14:39:58 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 22 Jul 2026 14:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1784745597;
	 x=1784831997; bh=pSHvLgJWrjShNYNpwZHHAdPKFXYcH5yjBRYdaLU4yTs=; b=
	FJLgy+lIwGp4QB7y5JRrAtEVkV7mztPNeKLqwGPXmNKcd4bKY0w//FXvLqRXweoM
	xAtdKcWl+TbJGbQtkluHRo4Ja9Smfgezu18SrETfcFi5Y1uzncjUNAL+pgTpIzx3
	zhNmloeKOreKLK8U2WeOuAJ0InKBWTmetosAh71l9x5sAbMBLM/ssQ0p32ODkU4L
	nlo0jmRtxhg/OFhTqEpp0a3SE4BsS7ias+VrmJzxLJz7feKElFFymF634lEonv8O
	azto3qsCxe7IcQdR17RVsjqlmMeMJWQobzyqgEVDhssW30tQlc7ZAoVUjleGYM15
	kOXuVIGfCkX5tIGpsClPIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784745597; x=
	1784831997; bh=pSHvLgJWrjShNYNpwZHHAdPKFXYcH5yjBRYdaLU4yTs=; b=V
	G1I3xKsqwzSxhPS2QRdD3yBTotwUYV7KAKA2R9a1/UCGQFmcLpbwANZFxA5n0Fs4
	l9F1godcfW7nrtyGJ0OAuCOCdb6UysPPYLuCTYjQQ72lktGpPlTe1gymzfx3n4lt
	IHtUkxVsytthoG+x/uXlsXTukS3M16YcHiTJOcz8EgrG9fC6KsOu0ZjN4mvMOQJ3
	tAbVoylw5kr+hw6OSLC3rL8SYCxp4Mo7EAasxPn95ZWxpXEPIKXEkuSL4lrBpx+9
	UInEK3PuOvdPWEtmvp2yilJWb5i1hV1agROyCcO2rvhMB1YeIqfqgrNY8PmHMG+V
	Lf/Dnu9ktEmHJjqEDSbIA==
X-ME-Sender: <xms:fQ5hajLsK-W97JekimzFiaN-uR5sk3tSVZZnSXJPFlrg6bANDynU1g>
    <xme:fQ5hah9Rj_8efig_9IV5V6fZKx_uGOQIeTELhP3WppK5t8L43Rd3J4fr-rov4qXcK
    QQc_B8bUBf9EY9nn6iVZLym6wGdPTnKRp5SoTo25UUuTbZWXOX0qcE>
X-ME-Proxy-Cause: dmFkZTFgoy3vtFk4A5qBQP/5QEq37CLlbLsz9oIElJIzfeVQNDxMVjqUL/g8GpmeasDKLn
    Q0gQQvySjJWqVn3LY9U8E78ftryDMw3JO2V9WMGHMzB8/NxGK25ZZzkerA58u2TI6RboVt
    kiBnzervYbBO8odh/3vSpengPpCTNwsiMlROSy6mf697jOwAfA/RgFMpMEQDVqGrpFXYuo
    fPuUvs1sCEHqCqxw/4hmn8e4Ava4fcFLxKIVEcGq10laxPOhQKDgiPpuEio+xZd2oebqri
    62NopTjd9BEmW/HoRG9/7+cg8v6mrjKmsAUzY1cd67N9ZAFRm/6OcVaDvja94VduIErhfn
    y9maKe2IRdaBrfj0KOHdd1u02N4lrpVv4oTAyzgEaO/0vsXoHU02YLZ42po+Diu24VLAp5
    1y5YuPihREwO4yxPhs+mwZwWTKGBYKvjjQ6LrRWD0G9ur0jBnQqyCYh5qkVcBgizgbsF/R
    +NfaAV0hzIBiowG/rkncKNZ+TdiRE9+Ff1586Fj32nB72n8TpCKi18VCeTnPD3L0P2K5T+
    p0niTO7bS/ZWNO06dWyAKbXmTcRThnlIOxtm3UCP0zPthjifLaES1WYuj4ukgWuyHOBT33
    Fxp5t/IPqvjOWwraTsqsASRiqASnZ8+x5XiVXj6oUJvAKne/t6b/UX7Rsm7w
X-ME-Proxy: <xmx:fQ5hap76GIuKJeq1X9D63NKkpge_MQGR3XOP-WKOLr-BE89E0omsLg>
    <xmx:fQ5hapeJKOtcMZnJdICemzUFsU_kvgiD-mVYg5aQLpjedA7OeD0v8w>
    <xmx:fQ5hakEUMtwuqjMe-a8I67lhsgIwj4IUUjhUZL76hYccR2Ir8BPimw>
    <xmx:fQ5haiS7_dZr_gvf-a5m5j671b_ElkPat6WUFtNyqPQrW85G5Nxtlw>
    <xmx:fQ5hatbj4jVLWFi8_W0jjSat952Th1GBqwnb_BZpYh5WAOTdaSO73J8->
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BCE52CE03C0; Wed, 22 Jul 2026 14:39:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AZHJDYmd8-_3
Date: Wed, 22 Jul 2026 14:39:37 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Ike Panhc" <ikepanhc@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Philipp Jungkamp" <p.jungkamp@gmx.net>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <12b978d2-7742-4908-beee-cfcb2e5aafaa@app.fastmail.com>
In-Reply-To: <20260723-ideapad-rev-exit-v1-1-bf0d8ac9b5ed@rong.moe>
References: <20260723-ideapad-rev-exit-v1-1-bf0d8ac9b5ed@rong.moe>
Subject: Re: [PATCH] platform/x86: ideadpad-laptop: Fix driver unregistration order
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Minor - but you have a typo in the title (ideadpad) :)

On Wed, Jul 22, 2026, at 2:35 PM, Rong Zhang wrote:
> There are two drivers in the ideapad-laptop module: a wmi_driver and a
> platform_driver. The former is registered before the latter, but the
> unregistration order is the same as the init one instead of the reverse.
>
> Fix the driver unregistration order by reversing it.
>
> Fixes: f32e02417614 ("platform/x86: ideapad-laptop: support for more 
> special keys in WMI")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 4fbc904f1fc3..8213524504ee 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -2564,8 +2564,8 @@ module_init(ideapad_laptop_init)
> 
>  static void __exit ideapad_laptop_exit(void)
>  {
> -	ideapad_wmi_driver_unregister();
>  	platform_driver_unregister(&ideapad_acpi_driver);
> +	ideapad_wmi_driver_unregister();
>  }
>  module_exit(ideapad_laptop_exit)
> 
>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
