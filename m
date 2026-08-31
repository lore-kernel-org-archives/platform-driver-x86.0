Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD0364028;
	Mon, 31 Aug 2026 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204262; cv=none; b=ctY3zbqNsIDggf4OoNUrPKdhFz/GGLZ79w3BU1n6V3JX/buTZ+cON2PbbMJu3F16O0KkR6gi0lNtovMFusAHejIagttSusdjJhMtDzgF9kn2vw5KFVTkD7O7ym4fg+IuvlzFb+XLTnUIDm5JErErWHUiEemFQh9QzhbzSeLan6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204262; c=relaxed/simple;
	bh=L3PFXy4airdCjhPvQN5kC7Ofq6ujA+8GFp65OdWJtFM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NwvjUWhEplL1sV1HFVaLh077xCfuHnH+UoLxTZMOiSHPR+E5nZV/+a2o9lu5K/zVd1PwocILRRXUnEj4Q8FWDRMOFJcOiCWGtFLSq84YZ/Lv4Dy0yWZbojdyWxD+YCs3BbhTZ5F0Yu4i/Nn2U7Yj0ioIJsG4D9ubTA0vmOvRFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GCgM5suk; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GCgM5suk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788204257; x=1788809057; i=w_armin@gmx.de;
	bh=L3PFXy4airdCjhPvQN5kC7Ofq6ujA+8GFp65OdWJtFM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GCgM5sukNBDYabyWpNcciZE00J06U8d4ReYSzLAeuMhHQdqM1xaAMvQ6lgKrC5i/
	 YRvhQ2e3CyNVSKb0hmmufA4TsY/rgwcshFTRKpqzhlXwc/AWdDcHAc/aoDSOHsJSs
	 YmbgeAf4dAdStWrgQ2Zyz88vdwecKTIHn59e66r26ycLit+G+dV5P+y+9ti90PHmn
	 dxaC6YvU+ga0+neAaP4GT0xjryib2EWlKl+fS4eBOiIIHfLUFxGmAKHAxchzeAZFY
	 kWj+nkJqFCNCuwrJ5ue2VwBP7mSQ12LYLq7A3fAAJLaXa4np4aPWlDZzsffzPXFtP
	 +r1Irfe6yiahlsF9Eg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1xTh4z0eNs-00PnNt; Mon, 31
 Aug 2026 21:24:17 +0200
Message-ID: <897b6ce4-dca0-467c-b414-c9c2144a40f9@gmx.de>
Date: Mon, 31 Aug 2026 21:24:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: asus-laptop: Fn hotkeys no longer work on ThinkPad SL400 after
 378500dc1313 ("platform/x86: asus-laptop: Register ACPI notify handler
 directly")
From: Armin Wolf <W_Armin@gmx.de>
To: Mo Jun <royclark086@gmail.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1146124@bugs.debian.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Denis Benato <denis.benato@linux.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <178806598504.23591.11490486941444891398.reportbug@localhost>
 <178807922598.807847.18300931641658404390@eldamar.lan>
 <ac830f9d-ea86-4f49-b88b-9aa8a09015c0@gmx.de>
 <CAL2p-7jB4LUEPhyBy2QjtK+Cn_hMBQ+ereWZryHpZ3JDJ_ZpPw@mail.gmail.com>
 <CAL2p-7hqJOfzLuuXF0b=H1zAzirp4UN+Ty59W2F34PCAdstMsw@mail.gmail.com>
 <86edbe0c-21d6-4e63-bd14-8921ca866b91@gmx.de>
Content-Language: en-US
In-Reply-To: <86edbe0c-21d6-4e63-bd14-8921ca866b91@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bSbvQshsAl1AywAvHQ3KAVouRr7sa/MHojzfrKjnlQHtwR2776A
 uPXqLYtvNUPxRHPAiccfC1XVNYdUgoX6OtSchv890PPzm0ckIDUf1IXNKHhLZSRHGMc20yq
 YPEATj38/7LR+c1JfSb5isjqrcW2KDnCLYScmPa/x+srHwFRRLkw404UksCXO9GfaL5i/qZ
 7CckN9d/Qz+ziLCXfw8qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c8Z2vV0l1As=;vadbAc6doi/aTmLRbU+DLapevb1
 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

Am 30.08.26 um 23:42 schrieb Armin Wolf:

> Am 30.08.26 um 16:41 schrieb Mo Jun:
>
>> Hi Armin Wolf,
>>
>> On Sun, Aug 30, 2026 at 9:26=E2=80=AFPM Mo Jun <royclark086@gmail.com> =
wrote:
>>> Hi Armin Wolf,
>>>
>>> On Sun, Aug 30, 2026 at 7:59=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> [...]
>>>>
>>>> I think i found the culprit, could you please test the attached patch=
?
>>> Build the module with the patch(only "make -C .
>>> M=3Ddrivers/platform/x86") and load the built
>>> drivers/platform/x86/asus-laptop.ko, now the Fn hotkeys works again.
>> I found that after rmmod the built module, it can not be insmod again.
>> Also the system experienced NULL pointer dereferences in
>> acpi_bus_generate_netlink_event() which may related to the built
>> module.
>>
>> I guess these was caused that the patch only change calling to
>> acpi_dev_install_notify_handler(), not
>> acpi_dev_remove_notify_handler().
>> After change ACPI_DEVICE_NOTIFY to ACPI_ALL_NOTIFY in calling to
>> acpi_dev_remove_notify_handler()(see attached patch), now the module
>> can be insmod again after once rmmod.
>>
>> Regards,
>> Jun MO
>
> Good catch, i will send the fixed patch soon.
>
> Thanks,
> Armin Wolf=20

Alright, the patch got accepted upstream and will likely land
with the stable kernels in a couple of weeks.

Thanks,
Armin Wolf

