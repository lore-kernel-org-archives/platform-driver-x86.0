Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD21E9B34
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 21:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742591792; cv=none; b=tcidOykqWiSVCrsDLFZckQUBp3Sb3v23iKipQS0yZR8tk0LFYWVgDHSM3un16jHooKicGoQJRw0mlD/YPSyrAkgb9lsY247nNgJNarYVGXgblSDM8tsymnLg7zw7OQE1TO9BVYZMdUmjuph32Yqu0KCqBfoxtW1D6Mvu6/4qVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742591792; c=relaxed/simple;
	bh=RMhEd3RVl1beKOEgIsvouPaky7HXptKFirkQC3rjQGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CU2AosOmspu5DkofgV/lmldMksFBzTuSO7uwLDJqTcj4agV6BKhz8gMZ45C0R//28GxkNXX2nnhxstl2wm/8NqFloqosx3jROnrcGf7yVkMzxdH4n9XuKwBNzqkDJbfuCSl/4gGM6kWcKtH/mtp08DzqHxz/ZzgP/XXy6vg+bx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uWKCamIL; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uWKCamIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1742591787; x=1743196587; i=w_armin@gmx.de;
	bh=/NunGCfs1dAyVh3brj1rE9PssemDfCRMHNRNHSfHIyo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uWKCamILyDi5lNAZLYAH2s3p5suEs+fzTWDzsCXptZMv2gdSip4MesIwsCyLHh0G
	 JX76F5XllpkXEx6XLydc6Bqj7p2mWYcJ7K0U0usZklylasDcDNXtVikEEh67ws/fC
	 8Gp5OpNNxM4KVdb1ef4ySmGZhfCpirWURK88ocQCMVy9SO2Yzlt9G8BjZVLtllLpW
	 tSe+W8aqg3iRUZLtaZ9uM7/oivM4SbGs0VPevpQ4NctdMrzD171akdaMpPwRoj0Fv
	 Q+ylNBmpiZrT4H2xV+xr6ON8UQuOwXieVyVPpp8yibqIdhPNPvPLiw+MiYstnDf06
	 yXyPaWKe5FlGHOe0wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1u40uz2Mek-005OHf; Fri, 21
 Mar 2025 22:16:27 +0100
Message-ID: <3b7c719f-8aa6-424f-92a0-e2cf05b12ca0@gmx.de>
Date: Fri, 21 Mar 2025 22:16:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmf: Use meta + L for screen lock
 command
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 Shyam-sundar.S-k@amd.com, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20250321193052.2973537-1-superm1@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250321193052.2973537-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oTvAgo2S8qNBvUrWr3VicZ0nf081XtjuBhwFihq2jUtnhmRlCXs
 QajTAZLRI+ViV41o1vPYo78DEHpqPmkEjDSwSdrtBvlaD2ZSJEz6MZQPhcdxAhfI7Hsu71M
 GqmMTMUoC+bQfCH+6dwK/oeIZhA0ui4wHO5LxVC561+OA9nMjBFoL2K+OsITw5nUq3gbD01
 caZddLIOuRG5tGdnX4e5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AOfSm6K74Pg=;a+gCzYE8BkOwGylF/Kp6PrGG7ey
 MRWWbYuRo/Boq/O0yIwIFkYR5g4B1AWoDi0f9Y+funOO8E8Hed0bwfrJq37YhFvpeaioKPkiK
 Atao+Ovp+tOAuuuFLCwll2LwB0mXquvU8MNRUy5AvAFnpY8zZtFtzMsD15O1GAPDQ0ok3T7w3
 li3is9BgJvC/RsbTbETQzAG7pfLqAzfiTO+n/K51+XzqvgMQfEuKQrSDSfLSU4cE+iPrj1L5Y
 NbQC36J5PIqfOBUdTTfJ0AduHlk2lfYm9mduxnb7RU78LWg9ULcNNEWRiVwCyp4qJ4payV6Qf
 WiCQCt4yeFdRCD4dqtjvwTEHux8+s0j+UZ3+cgRLCZuTxKQbSMhh4CMt6/E2zFC6gUmT57OlZ
 zvFUO9VW10E5svB2dXMtHktNOpc2qSq08eam61v5kQtc9cKa4VnErUJWyBdW89yJ2e0mbPp+e
 vtu8mkGkcgFLePr4/IQ5b1xMJgn9XhHBHom+g4xZ4eMLJiqt/G5Soxsrdy1i/FNbT10zJjjh/
 XOChAjooNFB1hhKTpuQPHKVFGCjrwq+sCZoVMiDwSz+pWjIei/LfFFLmgP2KCRyOf0M4c1JlS
 iW0OFBpGDKBhdKGQkqlpJqUg6EEdcPKDoEDo1vrPSeCQaUB9w1qV+w9lT0waTCVKqRfGpbXle
 4++HEst88ndfD7fXirBs07nhZuLJ2VQQZmsz9v7O9pEe3IlEtTN5nDjbMB8pYhPka7wvLxi5Q
 alw9sr4GSBSBmz01267gDIDIPaPLDfzfI6+P/OJKE1DwhayN1T41naTq18yEJQrqLXtCBYb58
 e2Mn7xqyTHG0u93y8cKIpZPopdifeNl6XrOIjkuYExZLPHn/XlQemBZDTMGqe++2o+njld22y
 PXOm0RZxd6RrnJMv2/eYDywfQ4dzZDGyvkemw1oVWGEXFT5gSqpU8A2+dY+Da2APc8h57gh+F
 zlOot7l2EwZr8VWqYjH8eYiFzK7Tw1CTm/1lZzQXs8T1xcu+5LuATf1PF7KL4durobgPsczoy
 OW4acwHeb1WfxAOgRzm8O4hVY58nqh1WopTumzc39tZO0eUELyw60H5wxaYHDSglyAv5q6Ja2
 w36c6WY5zWuu5WCoAB2grAsY5v71U1eo6I8J+c8D07XUGwkLyrl9n9UNCBOEHOpQmiLH8hrPM
 +rH/PQipwWhYaBQAd7S/OL3NpS98GERzQqDeP+LK42Di+qe57hAAFkcsa65WzNuglUlQkZM3u
 dyBX5lE48K2ipMew+GO5A+rwTnUb56B1/ST5Uy0YYS1ZXLQFzBUkXqfqkGCgPwKcboLVT3ldN
 y/1M/BEU46AcatFTbESCK6sTm3ZtS5nGq67A3Ilg73Vgc+auTdNgTfgIwdVasejIYjK4xXh+T
 BT8zO9xmMAd9ptzxrqVHUF6vUUkCRchxhRUO7eMOAhCRFXlkANv/kSYeW+IWDOwMgcK7gS4Kv
 PHWfLUw==

Am 21.03.25 um 20:30 schrieb Mario Limonciello:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> In practice userspace software doesn't react to KEY_SCREENLOCK by
> default.  So any time that the PMF policies would suggest to lock
> the screen (for example from an HPD sensor event) userspace isn't
> configured to do it properly.
>
> However userspace is configured for meta + L as this is the default
> in the ecosystem. Adjust the PMF driver to send meta + L.

Hi,

KEY_SCREENLOCK is used by other drivers too, so it would make sense
to instead add support for KEY_SCREENLOCK to the userspace software
instead of having this workaround inside the driver.

Also please add a comment explaining what meta + L is supposed to achieve.

Thanks,
Armin Wolf

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/tee-if.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x8=
6/amd/pmf/tee-if.c
> index 8c88769ea1d87..2c00f2baeec7b 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -151,7 +151,13 @@ static void amd_pmf_apply_policies(struct amd_pmf_d=
ev *dev, struct ta_pmf_enact_
>   				amd_pmf_update_uevents(dev, KEY_SUSPEND);
>   				break;
>   			case 2:
> -				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
> +				input_report_key(dev->pmf_idev, KEY_LEFTMETA, 1);
> +				input_report_key(dev->pmf_idev, KEY_L, 1);
> +				input_sync(dev->pmf_idev);
> +				input_report_key(dev->pmf_idev, KEY_L, 0);
> +				input_sync(dev->pmf_idev);
> +				input_report_key(dev->pmf_idev, KEY_LEFTMETA, 0);
> +				input_sync(dev->pmf_idev);
>   				break;
>   			default:
>   				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
> @@ -422,8 +428,9 @@ static int amd_pmf_register_input_device(struct amd_=
pmf_dev *dev)
>   	dev->pmf_idev->phys =3D "amd-pmf/input0";
>
>   	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
> -	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
>   	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_L);
> +	input_set_capability(dev->pmf_idev, EV_KEY, KEY_LEFTMETA);
>
>   	err =3D input_register_device(dev->pmf_idev);
>   	if (err) {
