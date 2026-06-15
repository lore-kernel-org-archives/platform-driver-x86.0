Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC8A3B6378;
	Mon, 15 Jun 2026 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562497; cv=none; b=gtdKe++zVLJiRZpuStM3pChbs425rZbIx3A2+jmtR7S4D1unpKCMcANtdEOiWr5dGM3UOjSouiZuUx5QAcmqUDB/AUZ0QxdztmZEKrB/3aDF28zZrz0BExJN9zFANT5Zj5lG+pvIfX2ydDGVeUEU3k4Hr+CD9I2rNAaC/A6Uoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562497; c=relaxed/simple;
	bh=hGtggvsAZQiAz+jP9qKrwBzMDZLiF0xxHJ68oNy9b8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqnHU309D0DBsyWfngoMJrgSdsdVt+UvSjLOsjEosRl9w6FTcXkoGEwyW8ZPL+r8FIjrabygdJa4WvwuElE0pRxynIkMCwLwYMdxwtBdBBOzuvZg050bEmXyNP//Rr0mT9tQBLAAxPiMLoeGl60U6AZmw81cTnEZ793/O4v0KGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BMKN9jwZ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BMKN9jwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781562489; x=1782167289; i=w_armin@gmx.de;
	bh=oj4o7EpL8vwFAZNlo3PwKxYSGSSh4em3n3YnYNqYOM4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BMKN9jwZtKQ3m0SYfrDW5pxn72ckcPgHHBYEi5GrT6/Fu1WAjZRRgtkuMW2i5cjg
	 LzQRM60QfwHGPKWwjunrgGxQlhqBYFeO6CdINCPfvMCmrHa28STg866R7Uif0ziUd
	 z9GV+VFOZkHBeA2xlVXJKbYxy6CC6F4Q13uPpvAkdoBwoe9M33e8UXhe88NvCfARx
	 fFy5ETeYaqFtgIMj3RoAEuiXOWQWfq0ppKlD03apGdH3UsK7nsk4Ps1SzrKWkdgdU
	 RF0wN7xWtmhXcDxpF1g+y+Maq5gz5h/X51kD+f32lrs8wZYjGCIh5HTV+9IkUy6in
	 Qm5OzUgXDrIseCWVVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59GG-1waLiW308i-00Ctyk; Tue, 16
 Jun 2026 00:28:09 +0200
Message-ID: <fa9833ee-f86e-491b-a1fa-625011a1ec47@gmx.de>
Date: Tue, 16 Jun 2026 00:28:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <178144969601.60470.13396800403157907003@gmail.com>
 <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
 <2026061525-dayroom-backspace-4273@gregkh>
 <5ddd81bd-b7eb-4c3f-b222-4fa3b4768d5b@gmx.de>
 <c2445ace-95af-402d-865b-b9451e92de88@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c2445ace-95af-402d-865b-b9451e92de88@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:A9DKNmkpFSr9IRf4oOIn5zusPVHto2V6kHTzx7vkf0YMo9jgvEA
 BFjAn7XDZLWAMgm2R9s34H2QuQHGmWdi3VBD5zvZZ5cSJBkyGIB/1Rrw9RPmqSGVx+rYev1
 aFWVDsUxntx5VTSpaGnRpHAwPe9YlFsZFa2OI7M+9PSHEdp+XF0gOCcJuU6b5Ch/JF2uisT
 zZaTbDgtTTo75oGgM1DYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gp5/LBA8Ra0=;AbP9ORV6GTVahinALregbHiYFJ8
 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
 OunqUiVTlMNkzyPk1I=

Am 15.06.26 um 23:00 schrieb Arnd Bergmann:

> On Mon, Jun 15, 2026, at 22:21, Armin Wolf wrote:
>> Am 15.06.26 um 15:30 schrieb gregkh@linuxfoundation.org:
>>
>> Its a "unbind" operation, either from sysfs or started by the WMI driver core.
>>
>> I do not think that this has something to do with the module reference counter,
> The misc_device reference count. The module reference count is
> protected by the wmi_driver object.
>
>> because the UAF is triggered by the device state container being freed:
>>
>> 1. devm_kzalloc() + misc_register()
>> 2. open(), uses data previously allocated with devm_kzalloc()
>> 3. unbind, misc_unregister() + freeing of state container data.
>> 4. read(), access to already freed state container data.
>>
>> I assume that misc_unregister() does not prevent read(), write() and ioctl()
>> on already opened file descriptors? If yes then i think a RW-lock inside the
>> driver would be necessary to synchronize the removal of the misc device with
>> any outstanding read()/ioctl() operations.
> A get_device() in ->open() should prevent the misc_device from
> going away during read() and ioctl(). You need to put_device() in
> ->release() then.
>
> If the driver->probe() function takes a reference on the wmi_device,
> that prevents it from going away underneath the misc_device.
>
>        Arnd

IMHO this is not the problem here, the issue is that file operations
continue to access struct wmi_smbios_priv even after misc_unregister()
was called during driver unbind.

The UAF is not the WMI or the misc device, it is the driver state container.

Thanks,
Armin Wolf

