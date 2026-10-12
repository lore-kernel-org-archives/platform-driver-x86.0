Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DBD3B42FB
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 19:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831689; cv=none; b=F1LZ9f4r9D+4i7mlSYr2L8FNuLDZRZH9NQ8A6lW/8qNbzUyFUCHwO4Nrj4Q3YDbK6m8wZmmwe1oVv6dPel3GZ7Oqdqx8WcLQV+vlcPbDanvoYq9rk+Abx40SeK1K8MlOKmErU0C7YU5XDbZyLB+MiIB3mUpHN1QUCBWFArNz29I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831689; c=relaxed/simple;
	bh=5h6GTBZOdcjTTlp2iqe91Z1ZzOslcVi1wKpU6jMX0r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ancE55cyUWJQfU0+je7uV/4bzv7UxqQo+/a550eoqwLE+t3l5T+sia2X+7wJBMW41XYoKN94axBIbp8n0j/LdGIWadrh0oqE12O+AheSMj8Wb7uvn7qt4CPzvHXoIwq4Zrn+ZcM6a2kfNLWUTW7W8Qqm//ud11NTu2V5czYC3XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjz4f5NN; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjz4f5NN"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1517bda04a0so1090923c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831687; x=1792436487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6GTBZOdcjTTlp2iqe91Z1ZzOslcVi1wKpU6jMX0r8=;
        b=Zjz4f5NNJLfmZjEZury3sN0kkp5kfaB0QWryU82lsLPz+B7POqQMPzj/YhWfW4D0p+
         Dsm4cUwJ+soQQt78ggzKBDoYNHMSYY9g6obOUA97bclB6vUExlJbX9M3Qh6yhoA+ftbr
         86GsIMocAQwVmPdde4AJUV1VW6yQcTvo9p0OasyppZ2Ec4gD2VoVpjx7OnRzqvWN4lMm
         /w7+XoGqBiv0U7MNMzYB+c5w3fIeWXRPU2Qyyb8fqIm9y9AwvuqSs7baX6tjVpTeLUSZ
         K2rydiP4PP/iykwzPeLkj7w24aYzycHQ01f85nw2fDHYBow0K1uQUynpeRD6D8r36Uhf
         ZS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831687; x=1792436487;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6GTBZOdcjTTlp2iqe91Z1ZzOslcVi1wKpU6jMX0r8=;
        b=lmlDqvKuEe49lErsmCmJi+QldfULAdljCPWiEuoi/ynyKFb/Poz/DRnAW9Dkh2x2BS
         qF8NE7IKUXgYoVBEZtyeZlXXI3Ye0m+Jwh34kpbh0SVihtiemNpDpKzNJxOdb7QYWNA1
         J9/LYlseZsIx3LliY5LoZWueUtPVXFCOBruUuQRzVhooOY7cfnuCd6mgKYWimQQ1a04C
         rfAmYxpuK1pTpaBlN715mntGCScD+DwsRY02pZM5enJyPX59aPptz+uB5BoTXIv/9zns
         /RfwVvCNNDnEtQbnNR7uVZtQmTJfQ3AV5vp49yvdd2XeWdbkZXKD1oq+R/v+huW+gJEQ
         Sb0A==
X-Gm-Message-State: AFq9FYJivjcvXj7ktBkZjBsw3Ies1zUFwZtyGR3AS5VCthPUbPMWi3lg
	Q2Lf4En7YQv08aKXO+oEqFEgA7E9MipaKllNaP7X1R0zBdsPvwRCt0DC
X-Gm-Gg: AYBFou1YHCnhgWKjpujN1pJzGTOHmWDLGcySRWK5wChMYzFlDizG6ZNb1xHUqvSw81v
	7SpR6VesixIF+ECsbH+/cSR/jG6t1T+jfJy9dv4Dk8xpzZE2jcBTrLI1yqooD6gyP357bbyq52w
	QYTGshGFUQJVVSUY6yw6d0Q0iLgEq9pLRS/sEh/XovuxkO08G2c4RxLjiFvu25kY6k4Ot1sFamz
	KzoLg70NhcOM3Jig5G5gt3zanGAYIUz4ZefIRLtXlcy+WU9SqzpWqFCaegKZzHPLkzMb6ZcZHgz
	ss0eVqgIS32MNSAh3gxdon+UnoAS1zfjKfBN81NQP2kTheE1Wy2IXjHCJ6Dg/l/n0zUcboibwlC
	dW/xtuRtFeCNCxgGXB+wDlpSK5+je8StLyCv3nR2Ce7TKgWxYRTz+EIpY4uGeoKvKrmoKpn6FcN
	5rkoJB3SxN6xY21Jz6a8VuigevfHWC7GHO+1uL3cYiyWdNV3UzNoOSXzGQHtm5vj9c9KIIJ0aaU
	radE/3g1rkpo0jhRwlYUXXi2Et/4bIRZrz+T6C6Mo6uPA2dGspUTjpTDD947C6ft9o=
X-Received: by 2002:a05:701b:4510:10b0:144:fb87:5b91 with SMTP id a92af1059eb24-16a5ef28a68mr13035933c88.44.1791831686985;
        Mon, 12 Oct 2026 12:01:26 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm37509290c88.12.2026.10.12.12.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:01:26 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:31:20 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Julien ROBIN <julien.robin28@free.fr>
Cc: platform-driver-x86@vger.kernel.org, 
	Suryansh Singh <technosfan14@gmail.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>
Subject: Re: hp_wmi: Unknown EC layout for board 8C9C
Message-ID: <as0tBtG_BZSBdfXO@archlinux>
References: <965dd816-dd66-4318-be8d-330a40209f67@free.fr>
 <asPy5Q5wNYaMzTqJ@archlinux>
 <4ce40bdd-87b4-4ba2-bf04-01f854680151@free.fr>
 <f3e855cd-259f-440f-be81-d491ae3df7e3@free.fr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <f3e855cd-259f-440f-be81-d491ae3df7e3@free.fr>

On Wed, Oct 07, 2026 at 03:17:00AM +0200, Julien ROBIN wrote:
>> About victus_s_powersource_event() to manually trigger CPU power limits change, I remember the problem only existed when performance mode was active, it was only about CPU power limits (not GPU) and didn't exist with any of the others modes (balanced, low-power or fallback). Maximum/excessive power limits were kept despite going from AC to battery, and I believe they also weren't restored correctly when going back on AC. On Windows with Omen Gaming Hub this seemed to be addressed by rewriting power limits on power source change. As I updated BIOS to F.18 I'll check if anything evolved about this.
>>
>> I'll do the tests tonight: Unloading hp-wmi driver and looking at RyzenAdj allows testing what happens when nothing is done by hp-wmi driver. But I need physical access to the device to unplug the cord, and also to put it to sleep mode, waking it up.
>> I'll keep you informed of the results.
>
>Hi back, to complete my feedback from few hours ago: having physical access to the laptop I did the complete tests again on BIOS F.18, same behavior as BIOS F.11
>
>About going to suspend / waking up the computer from sleep:
> - When the computer is placed to suspend mode while performance mode is active, and hp-wmi unloaded, when resuming, it's still in performance mode without having to ask for it again (even if asleep for more than 120 seconds)
> - About the 120 seconds delay before going to fallback mode, this delay is only elapsing when the computer is running. When resuming, 120 seconds are available again (even if only few seconds were left when entering suspend mode)
> - However when the computer is placed to suspend mode while max fan speed is active, when resuming the fan isn't max speed anymore.
>
>About power source changes:
> - When the laptop is running on performance mode, unloading the hp-wmi driver and disconnecting the power plug let the CPU stuck to maximum/excessive power limits (60/65W in my case instead of expected reduction to 25/30W when running on battery).
> - Same thing in the other way, when the laptop is running on battery, on performance mode and CPU power limits to 25/30W, unloading hp-wmi driver and connecting the power plug let the CPU stuck to low power limits (instead of rising to 60/65W).
> - However if the power source change occurs while the computer is suspended, then when waking up, the CPU power limits are set to the right ones by the laptop itself.
> - Also, in every others modes (balanced, low-power, or fallback after 120 seconds without hp-wmi interaction), on power source changes, CPU power limits are automatically adjusted by the laptop itself.
>
>So the laptop forgetting to adjust CPU power limits on power source change, only occurs in performance mode while the computer isn't suspended.
>In any other circumstance the laptop behave fine. Would be interesting to see if this strange quirk I found out by extensive testing also occurs to some others models.

I wish I could test it, but unfortunately sleep modes in firmware are
broken for a lot of laptops in the Omen series (including mine) so I
would not be able to wake up from sleep and test the states.

I did test the CPU power limits during power supply change as you
suggested. For me, it looks like the firmware is automatically taking
care of it. But to be fair, it doesn't cost us a lot to enforce limits
during such events, so it is fine if it is applied on all boards.

>As always, I keep available if anything more is needed!
>Thanks again for the work

I will be sure to get my patches tested by you, when I do eventually
start working on this. Thanks a lot for your help.

>Best regards,
>Julien
