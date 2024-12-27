Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279F2572;
	Fri, 27 Dec 2024 01:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735261611; cv=none; b=oUPsx1ktpDkR+L/o0FJYawr9tWRwB0dO7htdasPPQCY401PI/9nDWs+4Ib7LJM5kkRpp7HPFdnMiq7zoHKWsOuRETvlRFzScGVl7959IzD+NO1kS2FcuQOu+2Knt5XukLyuKQg4C1VQ1m9zH84HqC18oSxLVj0SuujWEH2nWTg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735261611; c=relaxed/simple;
	bh=8+JxbadNg8w2rcBNwlcdknAn2yI7v0HUv7fOl0CiUkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDB9zUwy3K1pTZTg66CVX/0fRjNHP61JSsBUcjcpyNoSih07jVvcRF3Dq4HA3h9WbxUbBi9vBwJ/sQpdp4rH7i9b5s4SNuwK+S0wiERjOyY2BzBDQvZcXfXI3ia8j2GdETkWNbJB8EVn+eSlvHrpXTckSDEqt76Ow8/E+4N89A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WFYVdFDC; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WFYVdFDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735261595; x=1735866395; i=w_armin@gmx.de;
	bh=k3lkInFtzDJuadGrlXbdWV00MmmhV7wXrrRZGHZhOqA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WFYVdFDCbAKpQeguyqeBVlshoRF1W8H45sD8keLQkd6IbNSGNhewRIeEqX9cJLX9
	 j15vd7So/d9v/3bXv7MBzwulA1OghsosOTrI9JSBcrtf+x0MGcG+BYAhlP8UNxuMC
	 sH6/WVZzfcpQF+6zk1gc0ZAwoZosHS1pGnhpfpW4+4pydLHxLaUDNpl1MPW/mWQz3
	 C3DMQ9+ywnbJI098chADj1fmard14ZE/7/A6HMFIyg7pUpCNOVXV7JMhCAjgG+2Gu
	 T49nsYcurgMYV+Ej3fnSPQjbTozMdjPY82IUHHUjy3Nhmid50tuLfvEuzz4JRp9LD
	 MpC2Wq6iOLA4WYwlnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEUz4-1tKs8f2YaA-00EgEn; Fri, 27
 Dec 2024 02:06:35 +0100
Message-ID: <87b30058-60e8-4894-988b-cce50f4d3b8a@gmx.de>
Date: Fri, 27 Dec 2024 02:06:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/20] alienware_wmi: Clean variable declaration in
 thermal methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-7-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-7-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N/3+Ess5WXybX0TeHsrp63s9lPYifZUokkIsyidPcDn4Wx2NZxr
 aD6enunttH1kgArdq530cIpT4K+3KRNkDBPSWa9r0i5wrsqZVhzECLpznKwfiGnVU2bbXHp
 A+34bUw9rfvySXQk7rPAEDFgnNdulrY6wLf4yMHJgpNKcj1EQSxJIelrNeVjIhWIWg5kcn3
 1fq9hZp8g3xOMk/12GZDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3WEOgDye+WA=;qMBVHhBo2KTtp9S53rHideTU7no
 IBuGH3mTRWUNEaEJUJatdpU6oGuvhMq1WvUpqCHnEhMSZmXgqX9kIq8BkJWyYz/EgYaWtyGyo
 EO1YJWeN/0Q64gdHl1ztwTW+fjduGga4YIid5k9sEg3zdpWqyNFw78baXk8CfI+ESGmG7IPE9
 S6q21gYi7XU2Mg+CUi7EGGY3rThqIMXRfXZvsrm5oaH6OUEfMxcPFdM9pPeMuHbwJz6ZkPe+G
 B5Xlj9XEu0DRayArisTJinbO7kcurxPW9iijsDz8eGj7SGRgZc+R2WMKb8V60YbW+YCLbJkOG
 KhD7nckeHaR5bweTM+TL5GmAJwK0q6h3EV7TD6YBbOXPEn1zxGqYPYjoXZismu9rdZFxAm0wA
 tOsL3oTJE1G/x1ZN7HzgXPCeffFcAQpHio3eNB6/zxmZSF1EWVbZTM39YRIhJFw2tyrilF42R
 nYmtt2apdyrBGlhkZ87irGxaFIGmXlPbL0gtopU8sJtVjobVASZWmM+cqJqUuXeFI/DioAL7V
 rlqYJDEYQ7Z3VfaDuQAaWjQuFuRQd75S+dwmtHBncBt4pYM7OYDrBdbWz88poYAyMywOc1d59
 VdEpoSGUNhUrWjCYXw005CbrDrcIthmxe2UoBacBtFG1g/RJqXwKnlsn9fwhq7VxYgKEIBtF2
 K5nN+AQRBbSnlTFwMRGTsZ0L2r1y8jQx7ntKLerMcw2JZNQaE8hIbTmr30opDHTxHCD/c9yUu
 ZKLBQvp3dySMcr6xPcosyjMhWsFxXybxbOWnzS9ZUkaxaV0KrpWps5y2mafq8bGvwXXhfWiwa
 HiCYAavlVf1kr9VRldD+9Iu9pfZf6BUXsX6u4yjidq2vHkApkSVeIjbdL7/oNH/VdBHo5GdRI
 syuDV5dZfSA9aC4V1SoKCoWyDlZLQvI24m0pYsSh7wFRNKJpot/f3/WRwPI2lyaboebJNrRi7
 81Yo49no/OIi7xo9Ukc9/LWDl3dAoLNSy2OWekbryER7WsUR40R9UBt0//xnTCgLqeygU8hOB
 ebgKSeubGg1+znmcnfDhPA/RCfLgS7aBSKsiKf6p12Hr1osFuT0oCd+8nh0SfbtiBjRq8AAIK
 RMRkgUh5RFUPDJ7Z+NudP7fEV9Rn8g

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Reorder variable declaration from longest to shortest.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index a431b1fec9fb..67cf376df0f5 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -923,13 +923,13 @@ static bool is_wmax_thermal_code(u32 code)
>
>   static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_dat=
a)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D operation,
>   		.arg1 =3D arg,
>   		.arg2 =3D 0,
>   		.arg3 =3D 0,
>   	};
> +	acpi_status status;
>
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_THERMAL_INFORMATION,
> @@ -946,13 +946,13 @@ static int wmax_thermal_information(u8 operation, =
u8 arg, u32 *out_data)
>
>   static int wmax_thermal_control(u8 profile)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D WMAX_OPERATION_ACTIVATE_PROFILE,
>   		.arg1 =3D profile,
>   		.arg2 =3D 0,
>   		.arg3 =3D 0,
>   	};
> +	acpi_status status;
>   	u32 out_data;
>
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
> @@ -970,13 +970,13 @@ static int wmax_thermal_control(u8 profile)
>
>   static int wmax_game_shift_status(u8 operation, u32 *out_data)
>   {
> -	acpi_status status;
>   	struct wmax_u32_args in_args =3D {
>   		.operation =3D operation,
>   		.arg1 =3D 0,
>   		.arg2 =3D 0,
>   		.arg3 =3D 0,
>   	};
> +	acpi_status status;
>
>   	status =3D alienware_wmax_command(&in_args, sizeof(in_args),
>   					WMAX_METHOD_GAME_SHIFT_STATUS,
> @@ -1045,11 +1045,11 @@ static int thermal_profile_set(struct platform_p=
rofile_handler *pprof,
>
>   static int create_thermal_profile(struct platform_device *platform_dev=
ice)
>   {
> -	u32 out_data;
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
>   	u8 sys_desc[4];
>   	u32 first_mode;
> -	enum wmax_thermal_mode mode;
> -	enum platform_profile_option profile;
> +	u32 out_data;
>   	int ret;
>
>   	ret =3D wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
