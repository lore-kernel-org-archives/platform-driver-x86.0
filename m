Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4E800;
	Sun, 29 Dec 2024 00:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735432323; cv=none; b=u4BnKGGObdGRvYgEyu7H+ZJLJgr1kVYbMS4AShDBU2JFJEFq0UDc4ye1xqgOk/Btd9V4oS6bLZi3FtUj1K/LaK1H92dsXhQa3w6+dQi9gSjgNOE7IJy8aT+y7rXMGv9x3hE0LuMd4T13UjBjWcrSARxLi/XUICfhS+i6NATwZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735432323; c=relaxed/simple;
	bh=6LjCTXSIpYXQXE46oJM18eyphJEEn4SHY9XLNbQ92tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUJUCPCtJU78kmt7knRayKeXVNKvjcem2w7WLZkLQGby2hXrZ7xr5sjCLf9x/5Fw+zhbjlw5z7Bv1h3ALtqu3hbEZb5WueNbag/b8x3rYvY0jZgRykyQ/AsMt1HENnXvVQb56upoNKVe2HLHRMKhbGzRocR2UJ3BszEGOvrva+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oITlT22R; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oITlT22R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735432308; x=1736037108; i=w_armin@gmx.de;
	bh=sCY8j7FN6eaY2Mdk9K7UquhPQG8POykj1Cl1FU26iUo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oITlT22RmL+372Zu5kKlecDS2M/srVa8eFha/NEXYZDe1dJm637xx6IXdTAO8m4Z
	 aykSJZOtiTgsD9X29hW3aXV8jh6v0YZgAP4oDSKHarYeeEM22UwYR32xVzMECXTdK
	 o68Pa1Nmmqt5F+zIg9L7dfthq/Im7LTVdjBwemsynQRzWnXOAwd/8wsvNuVVyq2TC
	 FqHzFUQcQPlE5F2fec8b9AeGOhX/lIapb17zFA2kitWfVSkRQ/zgkjyJbG2a3Zwhq
	 BVawcKZaBuWQO2/UdI9Suwygco2RFtQvAYSBRlQ87CMBSuxRpPj5iljsVlunlq0hH
	 08EQm9CnKcXUPcy7AQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1t7gI70995-00OD6y; Sun, 29
 Dec 2024 01:31:48 +0100
Message-ID: <160264ff-37e9-4283-898a-f6226faf2cd9@gmx.de>
Date: Sun, 29 Dec 2024 01:31:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] platform/x86: dell: Modify Makefile alignment
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-19-kuurtb@gmail.com>
 <1ea940dc-7a75-4011-bcac-7f56a6960129@gmx.de>
 <rrkvtxufsi5jrpohcttt2lpqjl5a4kujh6gmy4c45pu6vyqtt3@meggfkpyozo3>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <rrkvtxufsi5jrpohcttt2lpqjl5a4kujh6gmy4c45pu6vyqtt3@meggfkpyozo3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:UoTWP9G6IBApBbkzntNAsUwAhTzQFHphz5Cq7BVCN+rYI/NcjOH
 UDBvT8e7mpE4iIIm/kQRXYReaQcmHJ0BCO6UNB2ZkcUBHymKTqpYtan7yY5gBI4g1a61hqY
 a6qGGg2PcuetH1es5+2OYPItS71tgxI6xRHE3Sjwcawlcw5yJM98Mt6gEtcKxmbKj85AVmB
 Ek+tjBYiHoXap3j319UsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PpL/RMMGUes=;/Zvl41W7HkyWMMtPnABZbT4Tqt/
 yEpXlhTsRdzLqPxHohRPvNGnzKiuKkgpEUnTkd/wCdmg2W2YGcW8HlNumTLKBqa6nahMLZRBY
 zC+eukWnJ1fdn18OJPBt/jNdkh2YBMRPRjQyXwhnaRqY3sdWg9yw6JvtokFudoAqk0uCymB1N
 KG00oWPlay5GImhrR+DbnDbYwIMnOS3N48ULj6dGdH2VOgSrsQ4EvcbTVWHknoYsftCia8BbZ
 Kz11YZaWkkMbrwS3xF3fLnw76RNryhsy94gzJK6m0zaLp8PP37kmUucaIHmuGp4use1gBR2qJ
 0mEr8Ffx97fxo4Ehq/e8J2SJzWb4ErprGZuN8VrQHmovyo9G859xdFZowT1Q69+XJ6e+GrjIn
 RLDs8zHzgvmaaRQ530Qy1TPeIt2FDWf1qLJRcdCJsgk5VwVl5RRwYTb1ypfRWrH3SBDFwymZy
 h+3Fk+YFsZMdLdz21GHTn2Lz4+BRN3NXmUwkcoarLBC4WeOkJweJpo3VvrQArS231ZIL3uwtz
 2MZR+mYhnGtd2jTOy4ylEtiJzzxHgRZe3HhVS4eBwkkZj5fKdcUEwmDCfN9iHAK6MPCXrScY9
 gvTdoYXRFmkAzLx7Pnm17ezN14UmurvsSM2DlQ9DyhMvzhvcngHmKdjEM8QXwbqG651mfAgf6
 wkFz5jit1UWUVka3DTj0VSZrV5eoOX7otQ7Jm6WgkqHlDY/NAcL/5umr68xQspHo8pWu3z1WY
 kiXLaPc2Ou3Atass/+Qjs1PV0jLskznzh2fJIU95fSLdMR13itvRAvvSeajfPgnw0tGJ40JSj
 oh6VcKO78pq3sYV+mD23I41n3+672T6qBaVrsv9aqNINiA4wyFB019t8pg81K8m1FBRdlxXTH
 hkwR4bjuGzVpjHaY8aph3+YQmgc2Muly56lMjNN/HquC3TKVilUaUs4RwvVHZKvcroGH3F1k9
 pazBuk+P+zHbDvqN8Zxo3j4hj2ZYDL8uTC5kKqFITm67Q9MWOSZiCy1jkq9HMTlvKuLHTJeez
 D5Rxlm1hPIIgnJSPF1ZUgdkZStY9+RwKOeVV7xlB4HQsl68xwvK4g7FMxXdt4iVdKeVFPJEsl
 txTUXieBLtN+NUU3CNaqZmi1+fyDb5

Am 27.12.24 um 05:57 schrieb Kurt Borja:

> On Fri, Dec 27, 2024 at 05:05:30AM +0100, Armin Wolf wrote:
>> Am 21.12.24 um 06:59 schrieb Kurt Borja:
>>
>>> Add one more TAB to each line to support upcoming changes.
>> Please merge this with patch 19.
> I'm almost certain I read an email in the lists, in which a maintainer
> asked these to be separate changes.
>
> I have no problem with stashing them tho.

I was not aware of that email.

In this case:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/dell/Makefile | 48 +++++++++++++++---------------
>>>    1 file changed, 24 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
>>> index 03ba459f3d31..d5718ef34c48 100644
>>> --- a/drivers/platform/x86/dell/Makefile
>>> +++ b/drivers/platform/x86/dell/Makefile
>>> @@ -4,27 +4,27 @@
>>>    # Dell x86 Platform-Specific Drivers
>>>    #
>>>
>>> -obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
>>> -alienware-wmi-objs			:= alienware-wmi-base.o
>>> -alienware-wmi-y				+= alienware-wmi-legacy.o
>>> -alienware-wmi-y				+= alienware-wmi-wmax.o
>>> -obj-$(CONFIG_DCDBAS)			+= dcdbas.o
>>> -obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
>>> -obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
>>> -obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
>>> -obj-$(CONFIG_DELL_PC)			+= dell-pc.o
>>> -obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
>>> -dell-smbios-objs			:= dell-smbios-base.o
>>> -dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
>>> -dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
>>> -obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
>>> -obj-$(CONFIG_DELL_SMO8800)		+= dell-lis3lv02d.o
>>> -obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
>>> -obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
>>> -dell-wmi-objs				:= dell-wmi-base.o
>>> -dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
>>> -obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
>>> -obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
>>> -obj-$(CONFIG_DELL_WMI_DDV)		+= dell-wmi-ddv.o
>>> -obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
>>> -obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
>>> +obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
>>> +alienware-wmi-objs				:= alienware-wmi-base.o
>>> +alienware-wmi-y					+= alienware-wmi-legacy.o
>>> +alienware-wmi-y					+= alienware-wmi-wmax.o
>>> +obj-$(CONFIG_DCDBAS)				+= dcdbas.o
>>> +obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
>>> +obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
>>> +obj-$(CONFIG_DELL_RBU)				+= dell_rbu.o
>>> +obj-$(CONFIG_DELL_PC)				+= dell-pc.o
>>> +obj-$(CONFIG_DELL_SMBIOS)			+= dell-smbios.o
>>> +dell-smbios-objs				:= dell-smbios-base.o
>>> +dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)		+= dell-smbios-wmi.o
>>> +dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)		+= dell-smbios-smm.o
>>> +obj-$(CONFIG_DELL_SMO8800)			+= dell-smo8800.o
>>> +obj-$(CONFIG_DELL_SMO8800)			+= dell-lis3lv02d.o
>>> +obj-$(CONFIG_DELL_UART_BACKLIGHT)		+= dell-uart-backlight.o
>>> +obj-$(CONFIG_DELL_WMI)				+= dell-wmi.o
>>> +dell-wmi-objs					:= dell-wmi-base.o
>>> +dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)		+= dell-wmi-privacy.o
>>> +obj-$(CONFIG_DELL_WMI_AIO)			+= dell-wmi-aio.o
>>> +obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
>>> +obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
>>> +obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
>>> +obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
