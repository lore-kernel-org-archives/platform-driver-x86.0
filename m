Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044BA1C28E;
	Fri, 27 Dec 2024 04:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272368; cv=none; b=Ho4IHbjpIpotabfGQOFDq1vFPhDopRxSl5VFA1iLG86u0jFR81I6uziDaeSZkmr8NjGRwBACKXVobfZKVKi3Mj3XM/+J482OuW6z43EctsmUME3HlX6zfLNqZHMrkidh5s/Y8muu+FSMfnuiQdu1HexMCH8sEB2YiAReJ2vRcDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272368; c=relaxed/simple;
	bh=palw6vIBl9K+2pFb7sUJks5Zi0HR/q8S2bh5S39/kco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkCM1xjtMKb2qk/T6nqUdSDPxewW/khUaw0sb4GtlyOt8xH7WfuGsPXtrq9wZVlwW6HL8tcmWp1ke9svpdNnd2ybmn8wlfY9jwlh9CktJt4e2QhvQeLNM9RW0HBRdRPyf/o/feBcSPVfPqVOa//QnIW2A1hVwl38bBYUvfGLbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=K1Z5QY2f; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="K1Z5QY2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735272332; x=1735877132; i=w_armin@gmx.de;
	bh=E6np4zDj1qf5PX5NLuQaPxWS3YQIIlbf+ZlhscfBm24=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K1Z5QY2fmPxJi3PVyC603JcxBv/Ugam1YtLZwNoXXSvR7Zl/wgc8MWcmkroC3WpJ
	 KLHnqZdLE3uQUO+BJH8Fl8yOpQEwFWs9jcJlxqRvMwyG0GwWbUfMqZbTd5odOC/iv
	 pvHIEZf/UJH5WuY4QDFtEqVAcEJm5L4Ot4NVh+hdSRHvgtlNX2DxGAV9PcjltZGsO
	 gl+HdXhISG2fYOuKlB1zqTVRiqIv/Wjsfq9jmYHAoKbot/oecqzLNBLP2PEhjAKZ1
	 lLvgtmLv98FdW8OPw4DP/JUTM5igljBKXM6VMaDUcOrGkLOErAfbBcsayxflzIYqX
	 CPm4rLpNMl84JWVivw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTAFb-1sx5UZ0hup-00QSDC; Fri, 27
 Dec 2024 05:05:32 +0100
Message-ID: <1ea940dc-7a75-4011-bcac-7f56a6960129@gmx.de>
Date: Fri, 27 Dec 2024 05:05:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] platform/x86: dell: Modify Makefile alignment
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-19-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-19-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vXWVuZAbtxWIUg6atihgH4u3qk1POsc1inwgXXDSbvyNdB+kO8s
 dtXLUCOExAgMWaBTrZki1+EZye7k71KqvSX3sdXMip8TZkL4cnmvWWG0H6D7sFfmO9TZvzV
 Tl0/8UAy0bihpUvlMVXJyQXskLSahPZrnlwhYMnbZPxNNI+f3AcIrTGi7zcQ6BC70mum/b3
 4O16ELRHe1ndeMqB4YCsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:97rJWB2o4yI=;BMAp096lCq7tHA7ezqmiC5ZAnxk
 jyuARIJ6IhT3jmfKlsXmFYMdbnPOx3zBkuP/WrdgoPCXYLy9b1xZn7ssWGIRP8MaMX0aScyAV
 sWqn/HloHZAMtjJtkK0vKzWghDXYQ6M8bMGWShJT0MrR4fNGzRIscAkiL867UMT82DfAvsBPQ
 64NPFez04JMp0CvzhfWwRiCBbrYdMqcW6OnyBKjSWxuz7gH41GdqTInSFdDoI5HUYSCPJXrXa
 /6p8yYFz3nJkRalkypjeY/aZQjr/DCUmi3xjtWfglnJqPtVzEoTX2Wxiw/fqnMCcxwf96jAbu
 wX5cE1BVFRtwlrYsdGnFVxYr3nbH/uQNpJYSaNAYOaHURSSJgnQIF460Oz3ewO66Tc48uUYvq
 WIUbrPI9zwWSwIxpiPpKoj431Z5h1cw98CN9ZIG+XUT7/Y2DddYu7VHtw+OSxo1ThiTPnsr37
 2qAWRoy03eEjfU3DH1LpGiDg2x9GYpJ3gTyvYW9VIY3lGQBp0T41I9Frk/9GB/jPuyfCRi94X
 ldQzsCkS2cr2K+7Wt6ecpmU8P14MISBpZfsn8uK2EfF2q0CBv5/aU+iUlgM0kBBzrXqbjn5WE
 Xhr8Fu1X69ODUQrQ/evbDXwquG6giosW5Lj0WfIxOA8h7J/rIlMFNwLqbC9f5Axr5j6y6+853
 CqNAkBvNFrwtwrck6iSWY2WZLjawhM5O14UK3JiRaV933qchRZWbI/Z+Ze1LpCrP00mhoax8r
 dzcrFhjzZwlrVJOeLBE9Q7VdWoZQMUraXYlxyodsoyqgqfdK5CA7l1mNUE1EZ1GbZC7f96nNp
 KMQTktKnwNqQzEhlAZlU7W1N340Aor4C3xmdiSHhilKbxK2K6A1UHrj07I3HP/5MTpiOTi9nH
 b39N0pfFTgr+6vy6+DUOfxH9+yGzqiWkuuLms2gCf5BFZYnfofXukXeFK4/pMabFmRcNW72p9
 OQ/UUv5QUto/aH7+NKcIDl5xWW66xU1VTjL/AT4Hfm2sR5OyMIHF1ElksmxO9+J94IZ6DVMTp
 5bMNPzvFkDerb6Asdbf6jCGLipDHx5Jnoc5vz+R/ZY2LvsxAb8vzjsEqLy6p6XJLesdI8UqIl
 9YWDLUjiTJAMbpjrWLaHLp1vfCc700

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Add one more TAB to each line to support upcoming changes.

Please merge this with patch 19.

Thanks,
Armin Wolf

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/Makefile | 48 +++++++++++++++---------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
> index 03ba459f3d31..d5718ef34c48 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -4,27 +4,27 @@
>   # Dell x86 Platform-Specific Drivers
>   #
>
> -obj-$(CONFIG_ALIENWARE_WMI)		+=3D alienware-wmi.o
> -alienware-wmi-objs			:=3D alienware-wmi-base.o
> -alienware-wmi-y				+=3D alienware-wmi-legacy.o
> -alienware-wmi-y				+=3D alienware-wmi-wmax.o
> -obj-$(CONFIG_DCDBAS)			+=3D dcdbas.o
> -obj-$(CONFIG_DELL_LAPTOP)		+=3D dell-laptop.o
> -obj-$(CONFIG_DELL_RBTN)			+=3D dell-rbtn.o
> -obj-$(CONFIG_DELL_RBU)			+=3D dell_rbu.o
> -obj-$(CONFIG_DELL_PC)			+=3D dell-pc.o
> -obj-$(CONFIG_DELL_SMBIOS)		+=3D dell-smbios.o
> -dell-smbios-objs			:=3D dell-smbios-base.o
> -dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+=3D dell-smbios-wmi.o
> -dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+=3D dell-smbios-smm.o
> -obj-$(CONFIG_DELL_SMO8800)		+=3D dell-smo8800.o
> -obj-$(CONFIG_DELL_SMO8800)		+=3D dell-lis3lv02d.o
> -obj-$(CONFIG_DELL_UART_BACKLIGHT)	+=3D dell-uart-backlight.o
> -obj-$(CONFIG_DELL_WMI)			+=3D dell-wmi.o
> -dell-wmi-objs				:=3D dell-wmi-base.o
> -dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+=3D dell-wmi-privacy.o
> -obj-$(CONFIG_DELL_WMI_AIO)		+=3D dell-wmi-aio.o
> -obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+=3D dell-wmi-descriptor.o
> -obj-$(CONFIG_DELL_WMI_DDV)		+=3D dell-wmi-ddv.o
> -obj-$(CONFIG_DELL_WMI_LED)		+=3D dell-wmi-led.o
> -obj-$(CONFIG_DELL_WMI_SYSMAN)		+=3D dell-wmi-sysman/
> +obj-$(CONFIG_ALIENWARE_WMI)			+=3D alienware-wmi.o
> +alienware-wmi-objs				:=3D alienware-wmi-base.o
> +alienware-wmi-y					+=3D alienware-wmi-legacy.o
> +alienware-wmi-y					+=3D alienware-wmi-wmax.o
> +obj-$(CONFIG_DCDBAS)				+=3D dcdbas.o
> +obj-$(CONFIG_DELL_LAPTOP)			+=3D dell-laptop.o
> +obj-$(CONFIG_DELL_RBTN)				+=3D dell-rbtn.o
> +obj-$(CONFIG_DELL_RBU)				+=3D dell_rbu.o
> +obj-$(CONFIG_DELL_PC)				+=3D dell-pc.o
> +obj-$(CONFIG_DELL_SMBIOS)			+=3D dell-smbios.o
> +dell-smbios-objs				:=3D dell-smbios-base.o
> +dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)		+=3D dell-smbios-wmi.o
> +dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)		+=3D dell-smbios-smm.o
> +obj-$(CONFIG_DELL_SMO8800)			+=3D dell-smo8800.o
> +obj-$(CONFIG_DELL_SMO8800)			+=3D dell-lis3lv02d.o
> +obj-$(CONFIG_DELL_UART_BACKLIGHT)		+=3D dell-uart-backlight.o
> +obj-$(CONFIG_DELL_WMI)				+=3D dell-wmi.o
> +dell-wmi-objs					:=3D dell-wmi-base.o
> +dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)		+=3D dell-wmi-privacy.o
> +obj-$(CONFIG_DELL_WMI_AIO)			+=3D dell-wmi-aio.o
> +obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+=3D dell-wmi-descriptor.o
> +obj-$(CONFIG_DELL_WMI_DDV)			+=3D dell-wmi-ddv.o
> +obj-$(CONFIG_DELL_WMI_LED)			+=3D dell-wmi-led.o
> +obj-$(CONFIG_DELL_WMI_SYSMAN)			+=3D dell-wmi-sysman/
