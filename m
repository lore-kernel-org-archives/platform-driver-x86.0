Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16DB32D7DE;
	Thu, 20 Nov 2025 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636589; cv=none; b=dfMnYTrn0i1SdgSAdRiofk+fi2ldiT+18dLICwB388EhiCOXEpF2HzXWN4LOJeZHwXSLiiq9M2AWayyeXcaKZkDUHLzMjRecyX+KQQmnGsyQ1POiUGlUFussiSY8PtFZ0/bbuj7JeCdDzlROLuWcRKOerVEbBeZRpTWKzWP+KvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636589; c=relaxed/simple;
	bh=ba69S1bFZ0F+p7vGuH3XGFI5b++9r6ExqufEzBemRb8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gk8f/x2lBtcfEi0FavWwusxX4zyCVd68bf8SafEiWQk+CDUrV8fYEjULq1ZNKkSwB+EWQ7b6ugnmuqBCvWY+5DXQ0a2fD9H1x2qZqRe4zm+ltTpBekr7XG3GH+wpzPHGaudSskgfRsaqYknobI0T0KRj66WCwVjoJEKVLm7zTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=uHy9pCfS; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="uHy9pCfS"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8DC842FC0055;
	Thu, 20 Nov 2025 12:03:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763636582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cc0PtFbtCsF09g65XcWDD6OeK4tlgYKl7itp5LzjyxM=;
	b=uHy9pCfSJKTJR7MPQ9ZSNNf88eDvBhPicguesLVgOoNmtwmuakepXzvRcKeYesd/ZKL08o
	5Ex8DYXFjAi/6hjNmSc7zDP0PTSXym1QBbUwCq/T3531aKXdiulr+cUe0X2OWmrrm2Akl9
	Gtp2wt9Qenzz1mQW7sdxHTNybnhu6AA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <ed4d19d3-a438-4e0a-9feb-1c62edef46d1@tuxedocomputers.com>
Date: Thu, 20 Nov 2025 12:03:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/uniwill: Handle more WMI events
 required for TUXEDO devices
From: Werner Sembach <wse@tuxedocomputers.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251118150839.55336-1-wse@tuxedocomputers.com>
 <20251118150839.55336-2-wse@tuxedocomputers.com>
 <69819b2c-9deb-481b-b404-fc6523c87a3f@tuxedocomputers.com>
 <2b7d8dca-b476-19c8-0bfb-7f3c0ccd2323@linux.intel.com>
 <ecc8e175-af33-4607-a720-5c380f7b5622@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <ecc8e175-af33-4607-a720-5c380f7b5622@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 20.11.25 um 11:59 schrieb Werner Sembach:
> Hi Ilpo,
>
> Am 20.11.25 um 11:44 schrieb Ilpo Järvinen:
>> On Wed, 19 Nov 2025, Werner Sembach wrote:
>>
>>> Am 18.11.25 um 16:02 schrieb Werner Sembach:
>>>> Handle some more WMI events that are triggered on TUXEDO devices.
>> To avoid another round-trip and a version, please write a bit more what
>> this is about than extremely vague "some".
>>
> ofc:
>
> I tested 3 more devices (InfinityBook 15 Gen9 Intel, Stellaris 16 Gen5 AMD and 
> Intel) and found that these send additional WMI events that the devices Armin 
> tested didn't.
>
> These are: UNIWILL_OSD_MUTE, UNIWILL_OSD_WEBCAM_TOGGLE, and 
> UNIWILL_OSD_DC_ADAPTER_CHANGED
>
> I also went through our out-of-tree driver where additional WMI events are 
> bound: UNIWILL_OSD_RADIOON, UNIWILL_OSD_RADIOOFF, and UNIWILL_OSD_KB_LED_LEVEL*
>
> While I don't know which devices exactly use them, at least one device does, 
> otherwise we wouldn't have them there. Also I don't see any harm in binding 
> them, so I did.
Forgot the most important part: Why i bound them even when some are just 
ignored: This avoids warning spam in dmesg about unbound events.
>
> Best Regards,
>
> Werner
