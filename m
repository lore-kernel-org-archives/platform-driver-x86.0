Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F2184F;
	Fri, 27 Dec 2024 00:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735259720; cv=none; b=L5n62OWnOg3WGuX0BlnLiJ+fu7Sx//3+f7siGQmCdgxbd62KrrlqK17CBFntLUy4GgwLjiJXu7DmNgolRmAA4jLYOeqezo3X1qs8c39aytYPJm5tVKL6pHSgHmSMiqPk5xdYj5pkFuX7kWgaa4bZer2LWduH7vN1FjF9DXkrxEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735259720; c=relaxed/simple;
	bh=UWYJTFt0AxZMQ1XNZYjQktHqIJPokEtp15l6LH3hzGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWFrmpy+aj1Nsa4Sqa06vcNEtAZkTolahi25gH4QZIcIcQD7FjMlq0YMqH106VhMIan6fEkRKmcJqMRWR8JqbsbrB3KwI7j76Y1QWo+f+teJUVTyHgZRl/P1DXUZZLU/JR7+6HTjFXXKMolFiM3gfyDOTjts498IL5IyZ+qnQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qEYTbGTQ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qEYTbGTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735259705; x=1735864505; i=w_armin@gmx.de;
	bh=TjmlI7oxzJVFtKttiRe64cIh4wnGRUdysrvT9creItI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qEYTbGTQ30RcARWPSNyy4Z63T1m5wARL0inpim5WlgaJRHFqzqxD2eDmKipVuvCt
	 yXzWY5K/9uNk1Bb1XgZ0G3WjFmPcHlnJ8XhuD9k2Pm299Fiq49yUZ+uI1TvvKPAhc
	 O6HOO5aw8potsvZ8tj6wRvoFYfnI4/tNapHQCI6ar+Bl9osx3Xad0zVFiRDqMbisv
	 Bl3XZoXo+QhCqNO7gmb/il9yhTOHSt6nLiYDYmxnHQqnD/nx6elDzn21qMVE/Gvnb
	 zmCWgGqHHBGT2Z4pEu3uqZls37Bz8nexxV7DO3NO4jAHC34MYQf2Y6W7fLxbg0k9Z
	 f/vGS4pCxFiOJ28IMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b6b-1tRmj61F3l-0051vQ; Fri, 27
 Dec 2024 01:35:05 +0100
Message-ID: <9083aed4-5f07-4d1a-8325-67da102b6871@gmx.de>
Date: Fri, 27 Dec 2024 01:35:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] alienware-wmi: Move Lighting Control State
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-3-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-3-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oRuNXFUQWklib8n8SLVz1Kh+SyMOojCGe101P2xSVJRQAdvOuYX
 WXiXls9aM5AiLunFw+LL868KRCUe+RIjgv+H7Qca2TCNPU3mkhP3JScLIfj0UX3SwUx7ke3
 OW6c8TSw6qxJoYKoYBmxNSqkDEnKA1FYRvuU2mYJNJCb589Qf6pwrTF/v8XKN1QRe8HKM0Z
 gfpF+18SeOY0ZAGGCdPxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wdVo10UBkBM=;iD7lOmjgvfjej15HZQlvDkCLnGv
 sRC4HBu+/1hQcIga607RNQhjXlgvkkzNW8FdMIs23xcyQ7F42wbtQsNOMa4IQDGO3+3+/T6Np
 hdNajpDKcwk0X/ISgCZtyoWbpeoLrzDWtiYwuCvUpaFD9w2RcuIW075FHhLl1YIwss+/IiL15
 Z2VhWMsgV3FYsi+D4EulBjcWJqHscC/2wA7oIsugeHeJ36JlJ6dANi94+LGAvPgwQSAxaALte
 euHwsyweNty8oSStpyBsaNMTKxUeaml5/yO8bACWShMQVLEqD9NgpPKN+Gw5kmFH+v/b8H1Mf
 IbXBkh2L4mdFrfPC3eLj7Ohzho2kfQDONtulC8bUoIaED6bYE8KCyoIe9LabjD3x5dk6Fy1tN
 lq7DqIg/OAshUxKuP3a2xDxhMeeisIZ1SSXZlwNRxvtpiBkm/zVT3ldaw40Um0cWsh0mziyWq
 2EV38uHx/UGAQZi1BDQR1bXbWE/qCWUObVSFZY69lUG58GghWulIl+p2WpynWWlm+GefJBny8
 xnM1EdVYAfRW9Lc9aXBi9qXJ/elTpgzXLNUoLgJ6Lbhm3FDTiwTXP9oUXDHAVgu30TKUW4wg9
 Yx0n98lk3gcTYrR+CV0joILZzCgn+PRJbIXw5c5nXmckORf/fJjuMdVWAIKk9ahPMkWVwxxqJ
 U2L8eiRXUloWFM7hK0XQiaXHSijLayPlZdHVSKGEOm4I4uOtoaeJhKD0S3955Wzg1sKY1A6uL
 xx1zyOMKl/f39j4dmqPcSotsbOHVqNt7ubCu2+c1lFMEdhUw9cIyxMqNjHG5VAx4kyrbiFbqB
 MOG06pRB0cRhI3QOP7kxF+MfAz1z5ww+JlcxnsvcDo0tEL2bVp0iAQak1sf9XKPPBPmpOPO99
 qFDVru+0Quz18aSSCDcFPfNKV48eJ4dAj7jNLIznUr5jlkFaQEEJyhDIGbZOOG6T0AKir2dIc
 IOGTtEO2q57/vloIc9P/5B0toWH5WJT3HgQWBV5XAhiI4bLrlH1bPGLMUspoKZftbpsrBDGUZ
 hPUOd3dMsoCYytj2OHoT4DbeGKE+X6S5+pLDCKGfw/MMe3feYHcnWHII8LcSGXJRl2rSa77C7
 b4JSYFdiG+RyM0E+fkyGEW2jvhVbH8

Am 21.12.24 um 06:58 schrieb Kurt Borja:

> Place Lighting Control State logic next to other attributes of the same
> sysfs group.
>
> While at it, rename:
>
> store_control_state()	-> lighting_control_state_store()
> show_control_state()	-> lighting_control_state_show()
>
> Replace DEVICE_ATTR_RW() with DEVICE_ATTR() and do a general style
> cleanup.

I think you mixed-up DEVICE_ATTR_RW() and DEVICE_ATTR() here.
Other than that:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 74 ++++++++++++-----------
>   1 file changed, 39 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index ed66720260ab..c5ad0f95c442 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -545,6 +545,45 @@ static ssize_t zone_set(struct device *dev, struct =
device_attribute *attr,
>   	return ret ? ret : count;
>   }
>
> +/*
> + * Lighting control state device attribute (Global)
> + */
> +static ssize_t lighting_control_state_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf)
> +{
> +	if (lighting_control_state =3D=3D LEGACY_BOOTING)
> +		return sysfs_emit(buf, "[booting] running suspend\n");
> +	else if (lighting_control_state =3D=3D LEGACY_SUSPEND)
> +		return sysfs_emit(buf, "booting running [suspend]\n");
> +
> +	return sysfs_emit(buf, "booting [running] suspend\n");
> +}
> +
> +static ssize_t lighting_control_state_store(struct device *dev,
> +					    struct device_attribute *attr,
> +					    const char *buf, size_t count)
> +{
> +	u8 val;
> +
> +	if (strcmp(buf, "booting\n") =3D=3D 0)
> +		val =3D LEGACY_BOOTING;
> +	else if (strcmp(buf, "suspend\n") =3D=3D 0)
> +		val =3D LEGACY_SUSPEND;
> +	else if (interface =3D=3D LEGACY)
> +		val =3D LEGACY_RUNNING;
> +	else
> +		val =3D WMAX_RUNNING;
> +
> +	lighting_control_state =3D val;
> +	pr_debug("alienware-wmi: updated control state to %d\n",
> +		 lighting_control_state);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(lighting_control_state);
> +
>   /*
>    * LED Brightness (Global)
>    */
> @@ -589,41 +628,6 @@ static struct led_classdev global_led =3D {
>   	.name =3D "alienware::global_brightness",
>   };
>
> -/*
> - * Lighting control state device attribute (Global)
> - */
> -static ssize_t show_control_state(struct device *dev,
> -				  struct device_attribute *attr, char *buf)
> -{
> -	if (lighting_control_state =3D=3D LEGACY_BOOTING)
> -		return sysfs_emit(buf, "[booting] running suspend\n");
> -	else if (lighting_control_state =3D=3D LEGACY_SUSPEND)
> -		return sysfs_emit(buf, "booting running [suspend]\n");
> -	return sysfs_emit(buf, "booting [running] suspend\n");
> -}
> -
> -static ssize_t store_control_state(struct device *dev,
> -				   struct device_attribute *attr,
> -				   const char *buf, size_t count)
> -{
> -	long unsigned int val;
> -	if (strcmp(buf, "booting\n") =3D=3D 0)
> -		val =3D LEGACY_BOOTING;
> -	else if (strcmp(buf, "suspend\n") =3D=3D 0)
> -		val =3D LEGACY_SUSPEND;
> -	else if (interface =3D=3D LEGACY)
> -		val =3D LEGACY_RUNNING;
> -	else
> -		val =3D WMAX_RUNNING;
> -	lighting_control_state =3D val;
> -	pr_debug("alienware-wmi: updated control state to %d\n",
> -		 lighting_control_state);
> -	return count;
> -}
> -
> -static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
> -		   store_control_state);
> -
>   static int alienware_zone_init(struct platform_device *dev)
>   {
>   	u8 zone;
