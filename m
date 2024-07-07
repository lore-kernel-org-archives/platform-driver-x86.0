Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802316F2E6
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jul 2024 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720378409; cv=none; b=kQEmoxX2G9hprz8U0O2uWCjUYVGcWDE/dsIrMK8jzCNHOVGCQ6KQssBnlRGb1jIlXpnUH3nngIjEIqpxgqH41Q/lrsB7/AdMvQ5rmccNVZb1LKDzZ/EFF0ZxppSbGM4aPeNq4080BYl4rkHQBJsr4dmR1M00pyfPnGtRWdLWeKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720378409; c=relaxed/simple;
	bh=b+6wjEqM+CLuVmS6Ypgqg/0FB9fksMYqh2ajHQp4yOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fR4kvNMzOLsd5jxDFV4dEWBF/FhxfAw/zXOj+pzk1dxQJ+11y/0DZtPHqnziUepw7POkNsKSJ5rM6G34dOnzcGQ/BdDcpdJqQj3KOc5Si1C2hsg3FwcSY2NlqLwIxoFdRlgkRVvdDy5JknBKF58a5ybPMsF4PVK4vDEUvckPMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FWunHILD; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FWunHILD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720378398; x=1720983198; i=w_armin@gmx.de;
	bh=/mvsHBBKt2ge45ZCixgBbK6kDcw6L00JtxmTjbUmpiQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FWunHILDlS/gh0JBBb4ddXx4smDFEQOysMubAIlyIezddOEMfaPI49Y5DUMy5+Rb
	 ylyQ22EGcYTTNcKLy6s0Ri8qamqswEmggWw0cRMJ+iKPFoGQCN5SU8Knf2B34dVNB
	 Qc9cwYc624LS77vSRQjEXp5xZkhpxjunBbmleFTt9Df/+7z6PcyOR1zXl1x4hxhQ1
	 86cdGMnh4wZbLhesUXakyb9xw2CGzF5D9F9VkjFdQCzB4GZMKWyTyEObn9sUOnRFZ
	 8VX6Ro6Yr9//pt3+GIJTKHslPtFWSjB8lhBLSQLUGLJYuIePJmRii5Z40qgjnEqjI
	 tUx0M2I+3k8NYEAc8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQeA2-1sn1hY1mAo-00SoEj; Sun, 07
 Jul 2024 20:53:18 +0200
Message-ID: <c4e829d4-a35b-4965-b789-217a498973d7@gmx.de>
Date: Sun, 7 Jul 2024 20:53:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv9] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
To: Alexis Belmonte <alexbelm48@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
References: <ZofRxNfk-ExL5VnN@alexis-pc>
 <75b64561-db2b-9fa2-ecdd-d0b573f9b67e@linux.intel.com>
 <ZolVUBcjoJm_6NYN@alexis-pc>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZolVUBcjoJm_6NYN@alexis-pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aHgTsv4204s0AA2tCLKK6dW6yejt13/OD32CfQ6pk9+02RebJUa
 zIP/j6Hk29/z22YsH3+STz0t6MBQ7GSI7CcJW5jNI6QrtpTanAfJdKoLXDg/JQuYNT/eoyW
 Bz8tHL2iKKz7WFUYMtGTFvkRmKWFDRCDTCQq5D+HheB0snDYYra14K5vP62TvPYk5oE6LkN
 OcWDkQM2RFWOx9gqY/rVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZbvGQbfJh4k=;/Fh7+xe9qld+r87gIja8gkQvuUg
 UM1iSxfR2emZdOGYydvSDj+LtEt0FVWMKfY6SXcgrolsZ93u2HDJPVVyKhWWe7swRT8nmsTvD
 W0P+V8skHJd+Vap/hVY60QeDsNBC5beSPXNMTptVPx/Vd4FPHby6i3NRYzLVuqI5Q6dXBm9gq
 jKY09DaHB0Yh3+hchl7RK1DP0/dhkvCnnNHj/ZACIdcGNA91x8C4bZaMlNYx7ndkPhInLLfMA
 Y2NC4tGDZKwW6+o+/OjE3fJw8yde4Suv3u8PS5rvTCOBhkRcqi9I2YWcc+P+JimWLPT8C6M5f
 4OO2hYL1P6gwARzRjD5+HGGbXpc6KnwNkq9hrWn8vTxW6MSUEiR4oIoP77B5HgW+NrRsRfL7a
 60Tg73bYXlLwo2NWyiS6ZMCZmD/lWab2cwMowUzFRi14n+jiZGCXEA15DEYaWVGUizD8v2rmJ
 1R+wwwyCxkGKUqFgq4J41oKRijlq9pEMMDf4fn3u/4bVtQ3SNX4wh5PN/hgBzZ7ljoXjRiEyO
 Xz7dry0X12m58LpAyjc25UwZAEMJUm4CR04e2oGswaXREc8GebXSG0gOj8v8dkbB5VfSmNdJ7
 0jZ8DSRMFBe42MuUMD1vLvmoiCfZZyibPPQ6LgHtqXBVmjNovWYSMEnyrle3xFlOg9vXr9LhS
 v6JVvxsBVHGW3a9mB4Xs/KTooRqb/d+N3C6RcwZQb9C0U6OtJrKdsg7SI3CaUIldzxqhmapZM
 8Qrn4PTGDEC1dt6Vbvk82nt6PxwQ6eHcjj7I8InH9T17YDJ5nlsFr9JXPigFOQtYRi1PdhTGz
 raDMud14ANMcgnQKCI+4o8K+U/Nxb0RE5TQodvA17B5+k=

Am 06.07.24 um 16:31 schrieb Alexis Belmonte:

> Hi Ilpo,
>
> On Sat, Jul 06, 2024 at 04:02:10PM +0300, Ilpo J=C3=A4rvinen wrote:
>>> +
>>> +	err =3D unregister_acpi_notifier(&platform_power_source_nb);
>>> +
>>> +	if (err < 0)
>>> +		pr_err("Failed to remove ACPI power source notify handler\n");
>> Do we really need this? I don't think deinit paths in general log error=
s
>> (or handle them either).
>>
> This is something that we discussed with Armin in an earlier revision of
> the patch:
>
> On Thu, Jun 20, 2024 at 10:12:21PM +0200, Armin Wolf wrote:
>>> On Thu, Jun 27, 2024 at 07:55:26PM +0200, Armin Wolf wrote:
>>>>>     static void __exit hp_wmi_exit(void)
>>>>>     {
>>>>> +   if (is_omen_thermal_profile() || is_victus_thermal_profile())
>>>>> +           omen_unregister_powersource_event_handler();
>>>> You have to check if the event handler was registered successfully be=
fore
>>>> unregistering it.
>>>>
>>> Out of curiosity, I did a grep on the kernel drivers source code for
>>> register_acpi_notifier/unregister_acpi_notifier and it seems that the
>>> common practice is to not check for the return value at all (check out
>>> drivers/gpu/drm/radeon/radeon_acpi.c:785 for example).
>>>
>>> Should I still check for the return value? I also believe there's no
>>> proper method to check if a handler is registered or not, so I would
>>> believe that I need to keep track of it myself; but since most kernel
>>> drivers do not even care about the return value, I am not sure about
>>> this.
>> This seems to me like a very fragile construct, but i believe that erro=
r
>> checking should be done here regardless.
>>
>> Maybe you should abort loading of the module when registration fails, s=
o
>> hp_wmi_exit() is only called when the notifier was registered successfu=
lly.
>>
> It made sense for me to abort during module loading, so that's what I en=
ded up
> doing.
>
> I did a little bit of investigation on unregister_acpi_notifier which
> relies on a blocking notifier chain internally. This brings me to
> notifier_chain_unregister:
>
> 47:static int notifier_chain_unregister(struct notifier_block **nl,
> 48-		struct notifier_block *n)
> 49-{
> 50-	while ((*nl) !=3D NULL) {
> 51-		if ((*nl) =3D=3D n) {
> 52-			rcu_assign_pointer(*nl, n->next);
> 53-			trace_notifier_unregister((void *)n->notifier_call);
> 54-			return 0;
> 55-		}
> 56-		nl =3D &((*nl)->next);
> 57-	}
> 58-	return -ENOENT;
> 59-}
>
> So it seems that the only error that can be raised from this function is
> when the notifier is not found in the chain. This cannot be the case
> here, so I understand why most modules do not check for the return
> value, at least when unregistering the ACPI notifier.
>
> If Armin is okay with this, I'll remove the error handling and the error
> message.
>
> I've taken into account your other comments, and will send a V10 once
> everything's good.
>
> Thanks for your time! :]
>
> Alexis
>
Hi,

i am OK with removing the error handling around unregister_acpi_notifier()=
.

Thanks,
Armin Wolf

