Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F9E1AA790
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731350241; cv=none; b=OMGqvo+WWJoZsu0vFZFtkEzmvXOnzQEoLtKYIXVFnA1maK17Bq63xhnlbd3qzxjFpGO7/NAbBpQ7Z3LqimFkqAJuriJj9bv/4nkGoMpTd1LBgj8EFrnYVvRCXfk7tQercoVptT5WSYRBjjn/44tipJUJkuuOuKltDCTC4CRhRB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731350241; c=relaxed/simple;
	bh=fX4tbnsdntBDVYKQhqujKgkkbbowbDcSBulFaTt6b7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLw6alI3S9swEf2iImRVE+y4dyo9p9uUI+YLEKW/bSukC2va/f8jK4Rt2PkuAVzg4j7NcfN4pNoSkrZnOVJ0Wd8AXl3XZe1eAZzVCXi995gQOOIWcruKyb8kao1B5q1/MqMMd6AxxffMLaI6Jills+MRAoC2Mw0/JRk/Poaw6kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G4sh5w1j; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G4sh5w1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1731350226; x=1731955026; i=w_armin@gmx.de;
	bh=fX4tbnsdntBDVYKQhqujKgkkbbowbDcSBulFaTt6b7k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G4sh5w1jr3/Hh8uNu2b1VJnP7Z7py2HNRx6QQvKAOKym/wqeyAfQts4giPIqMMYG
	 UJ2Lliaee4oBuk30qv+zgCGxU9cb61x746dIOJ9MHQhQVoarnTt4J+93mgz14dCNf
	 BeVkEQIKEMlxFewpRKnu/6ipQsfIwA7EvH6/vC2jT5VTiY32Vk+B+k8JxIiL2nSEc
	 8UJok4iu0U2/h+Sjki9ElO4UNbBYXQR02usc41gRE8Bt7VZ9blARbC/9alC61bKpO
	 vtHfSXOc4ns0UpuRho7u2R/58A7cTySsEbWO0eevJIuDlDUtaQrqPN8jB36OxxsTu
	 QAL7SXg6F+JBj5/wRw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfNf-1u4RYr1mnv-00sesk; Mon, 11
 Nov 2024 19:37:06 +0100
Message-ID: <388bc9f3-3d0a-47f4-8cc6-beb7e2d4a4d9@gmx.de>
Date: Mon, 11 Nov 2024 19:37:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lenovo WMI camera driver, switching to SW_CAMERA_LENS_COVER ?
To: Hans de Goede <hdegoede@redhat.com>, Ai Chao <aichao@kylinos.cn>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <5666914c-e8c2-481d-8fdf-aff82865c228@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5666914c-e8c2-481d-8fdf-aff82865c228@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:G363t7f/Ovv8lY3hqhS4Qh9ccs3QWWLyRgrVpEGsaDwpn4RU7QV
 Y1+0RfQR2eKNnuiSadQr8oTEiFzql63evxFkjhbB+SzlgHjALW7F5c4e1Ru6+n4q8OSF1D0
 ixSTlYqswpFxBTtufMld8un0AVw+IjNyLXv+H7jYhOmrX2J8lLq8f3WoW5+NgbRQKmxmVMi
 arFW/TjNwbKkmhmGrpeFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o59o4Q8Vlvo=;slkx3dAJTdQGCcsYOnskwcSn6tz
 DTPtHToa6GpjKZY4XxssJOsXoZNPE/KOvlMq9aeGYeqotP5pOqMXHBGl/mbjxblBVQKuvGExC
 27HvWB3bkNIpaygNFbZaWLWWr2XTVOq9sK6hkYOU7a9/1SUuLxqbIMAt6KQBZtQOvAeUWZ5+f
 nZBocE0Nb7NNrnQ/FHPNx8d21jZRAIXQubpdaHibvNricnu8sfwLRzYezgGhrslgl4kcDOWOs
 zovX4QC7xtMKBYrzY4xn0X+x0SdcyWnunmrIVlV0J/zaKcNRHtLHSLhZ4bAxyUysGCemqaXH1
 evgP7xBfgpRlJletJ0WIy7AYKG94+NAFtVTioJC+89rL0i+QUH8H8XbUYwjF5zU6R6wau93qz
 RFeh1F/qbBdz2RMTOl3D7t87CCqTw9S3a90VClVXPkMTlL9r28SBb6CnDJkSZZO8ifKr1uuC3
 wtIyF3VsuJeHZddMSAV+HOsOzqdRaV6ut9nn5eVgnldgW9o6lcu+N7qAx25C+TujlFF8NBbgJ
 G0Ko39WpUUin2IQVcipTH8jvBBtN5NgjbcPQWeykAgADxrjGF6vB+smTrtaxDMsvWAhonSnMT
 1Dp0F6NswOZxWAB3qcUJmTElYxj4Q1D6pppBa2JJhUlK94+X3zaXBf3Y4hWVQAK1MM3KaaYbp
 0rqcinZveKdEv793L/GyjAMHfZvBvFQWBHJF2NSMoDx02AF0fQJOtCs0uJKe2hs1tR2mW3RGs
 OdW0DDjNj/5zY/ofooOFAvwiLZTb9GfTxqPqpAcbvLCdDzxM4K5peZrRhen9AQ+ReYAuUJ7qL
 LaTG30Bj847AzMMvxn5/2czTz4N0LJ3a1eTtgxEZa8YrEMIc0TPTGHmUtHmBSeAAWDNF3Qrbo
 L0OWSR8WeMT4KwLgSZm/wGGzzHqssdqF/WosVeh4Mk+4krOpnJ+uTM+DX

Am 11.11.24 um 15:33 schrieb Hans de Goede:

> Hi Ai,
>
> I have been looking into all the different way the kernel is
> currently communicating to userspace that a camera is disabled
> by some form of on/off switch / privacy control, see:
>
> https://lore.kernel.org/linuxa-media/a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com/
>
> As I mention there my proposal is to standardize on
> SW_CAMERA_LENS_COVER. This assumes that the button
> which generates the WMI events actually enables /
> disables the camera the hardware level.

Hi,

i think SW_CAMERA_LENS_COVER is misleading here, since AFAIK the camera completely disappears
from the USB bus. With a proper lens cover however, the camera would still be accessible for
querying things like supported resolutions, etc.

Also i believe that the intent of the buttons handled by this driver is to disable access to
all cameras connected to the system, so KEY_CAMERA_ACCESS_ENABLE / KEY_CAMERA_ACCESS_DISABLE
is necessary here if external USB cameras are connected.

Thanks,
Armin Wolf

>
> The problem with the current KEY_CAMERA_ACCESS_ENABLE /
> KEY_CAMERA_ACCESS_DISABLE events is that looking at the
> HUTRR72 specification from which these come it talks about:
> "Enables programmatic access to camera device"
> which suggests that it is a request to the OS / desktop-
> environment to block camera access at the software level,
> rather then reporting back that a hw-level block is in place.
>
> One problem with moving to a EV_SW like SW_CAMERA_LENS_COVER
> is that that needs to report the correct value right away.
>
> Is there a way to get the initial state of the camera through
> the WMI interface so that we can report the correct as soon
> as we register the input evdev device with SW_CAMERA_LENS_COVER
> capability ?
>
> Otherwise we could use the same solution which the hp-wmi driver
> uses which is to delay registering the input device until
> the first event (since then we do know the state), see:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/hp/hp-wmi.c#n792
>
> and the caller of camera_shutter_input_setup().
>
> Regards,
>
> Hans
>
