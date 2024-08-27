Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663A0186A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790318; cv=none; b=jz4NABcGXiDdienlEOTNgCexhGjLNDb5in23r/VgTNKhdkzyTNY0lUMBz1RN3GbQhBH2rW37CPJb0pbmpmXg5bJp7YXtGhPBtFZnAjD18LD7LNqHJUDL5v9kGRrtOlWJ6ApQZQ5fgGM7t7z00agpv4VmGsNGZgJil3ByxJF40qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790318; c=relaxed/simple;
	bh=IWULyQzsvHU8wjktGVnN2xnL9aSifbBo316o5trNc+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLVqvzGATwXLogLtzd5v+aH2NsFJGV8GfDrPDq9ASdckeVm40IW63QtW3hwQhvyma7DBtfT/TsLDWaKhs38NqQfSaEVP2OWzerEU9jelrd4wLx/FMSpT7Yvge5T+NZiPcfvq0dOqXTHQlKiloHWscTezoZ9I2HJYAt3NaI6ikVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matthias-fetzer.de; spf=pass smtp.mailfrom=matthias-fetzer.de; dkim=pass (2048-bit key) header.d=matthias-fetzer.de header.i=@matthias-fetzer.de header.b=cectXIHS; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matthias-fetzer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matthias-fetzer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matthias-fetzer.de header.i=@matthias-fetzer.de header.b="cectXIHS"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4Wtf2H18rqz3v0d;
	Tue, 27 Aug 2024 22:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matthias-fetzer.de;
	s=key2; t=1724789783;
	bh=IWULyQzsvHU8wjktGVnN2xnL9aSifbBo316o5trNc+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cectXIHSLkcYsw+PSb2kwOfn0X7ug7bD56m/zLvhkML9jBYdKPQ3LXABw0/Y0rDAI
	 MzcnmpmmKHljpCoRLG9WM5zZND5E9LARzap7i5O5aP61/WCt1tDUuTyyVExIRA8Nz8
	 5gXh4zDK6WSOouSdPCDwaxBqhvI+ZAV2WUvDkzgc9xtUOvX78Zp+eau6wMcTRp5tud
	 OPyZOygscT5XVMpe1TP1b9ipS1u5heUWTbMxA6UxibXu4ClqnyP7V53zpOnjUhk265
	 9UycJYQnUZOYv1zk4wRl42P+/CVIZY3pguHcgd0z5Eoe2v11ba96QLKyoSD2zI+WDR
	 aVlWKKbHCNQuQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4Wtf2H0RK8z3v05;
	Tue, 27 Aug 2024 22:16:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxf9a3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4Wtf6K0JLPz8t4H;
	Tue, 27 Aug 2024 22:19:53 +0200 (CEST)
Received: from [IPV6:2001:9e8:1a7e:8e00:a23c:e8ff:e9a1:df2] (unknown [IPv6:2001:9e8:1a7e:8e00:a23c:e8ff:e9a1:df2])
	by mxf9a3.netcup.net (Postfix) with ESMTPSA id 5568B40285;
	Tue, 27 Aug 2024 22:19:48 +0200 (CEST)
Authentication-Results: mxf9a3;
        spf=pass (sender IP is 2001:9e8:1a7e:8e00:a23c:e8ff:e9a1:df2) smtp.mailfrom=kontakt@matthias-fetzer.de smtp.helo=[IPV6:2001:9e8:1a7e:8e00:a23c:e8ff:e9a1:df2]
Received-SPF: pass (mxf9a3: connection is authenticated)
Message-ID: <0454c5e8-b773-456e-9845-a911774d0e69@matthias-fetzer.de>
Date: Tue, 27 Aug 2024 22:19:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531
 fan support
To: Hans de Goede <hdegoede@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain>
 <9566460c-4d0f-4ead-9fa1-a265c936c3d9@redhat.com>
Content-Language: en-US, de-DE
From: Matthias Fetzer <kontakt@matthias-fetzer.de>
In-Reply-To: <9566460c-4d0f-4ead-9fa1-a265c936c3d9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <172478998873.4585.998371354981114709@mxf9a3.netcup.net>
X-Rspamd-Queue-Id: 5568B40285
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: /I+rYqMRa8PjU2AIuo9EvF4FjQ9SrgKx1IzzAbMAm1+/gb36U0sqz57t


Hi Dan and Hans,

Am 27.08.24 um 11:09 schrieb Hans de Goede:
> Hi Dan,
> 
> On 8/27/24 10:45 AM, Dan Carpenter wrote:
>> Hello Matthias Fetzer,
>>
>> Commit 57d0557dfa49 ("platform/x86: thinkpad_acpi: Add Thinkpad Edge
>> E531 fan support") from Aug 16, 2024 (linux-next), leads to the
>> following Smatch static checker warning:
>>
>> 	drivers/platform/x86/thinkpad_acpi.c:8387 fan_set_enable()
>> 	error: uninitialized symbol 's'.
>>
>> drivers/platform/x86/thinkpad_acpi.c
>>      8319 static int fan_set_enable(void)
>>      8320 {
>>      8321         u8 s;
>>      8322         int rc;
>>      8323
>>      8324         if (!fan_control_allowed)
>>      8325                 return -EPERM;
>>      8326
>>      8327         if (mutex_lock_killable(&fan_mutex))
>>      8328                 return -ERESTARTSYS;
>>      8329
>>      8330         switch (fan_control_access_mode) {
>>      8331         case TPACPI_FAN_WR_ACPI_FANS:
>>      8332         case TPACPI_FAN_WR_TPEC:
>>      8333                 rc = fan_get_status(&s);
>>      8334                 if (rc)
>>      8335                         break;
>>      8336
>>      8337                 /* Don't go out of emergency fan mode */
>>      8338                 if (s != 7) {
>>      8339                         s &= 0x07;
>>      8340                         s |= TP_EC_FAN_AUTO | 4; /* min fan speed 4 */
>>      8341                 }
>>      8342
>>      8343                 if (!acpi_ec_write(fan_status_offset, s))
>>      8344                         rc = -EIO;
>>      8345                 else {
>>      8346                         tp_features.fan_ctrl_status_undef = 0;
>>      8347                         rc = 0;
>>      8348                 }
>>      8349                 break;
>>      8350
>>      8351         case TPACPI_FAN_WR_ACPI_SFAN:
>>      8352                 rc = fan_get_status(&s);
>>      8353                 if (rc)
>>      8354                         break;
>>      8355
>>      8356                 s &= 0x07;
>>      8357
>>      8358                 /* Set fan to at least level 4 */
>>      8359                 s |= 4;
>>      8360
>>      8361                 if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", s))
>>      8362                         rc = -EIO;
>>      8363                 else
>>      8364                         rc = 0;
>>      8365                 break;
>>      8366
>>      8367         case TPACPI_FAN_WR_ACPI_FANW:
>>      8368                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
>>      8369                         rc = -EIO;
>>      8370                         break;
>>      8371                 }
>>      8372                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
>>      8373                         rc = -EIO;
>>      8374                         break;
>>      8375                 }
>>      8376
>>      8377                 rc = 0;
>>
>> s isn't set on this path
>>
>>      8378                 break;
>>      8379
>>      8380         default:
>>      8381                 rc = -ENXIO;
>>      8382         }
>>      8383
>>      8384         mutex_unlock(&fan_mutex);
>>      8385
>>      8386         if (!rc)
>> --> 8387                 vdbg_printk(TPACPI_DBG_FAN,
>>      8388                         "fan control: set fan control register to 0x%02x\n",
>>      8389                         s);
>>                                   ^
>> Here
>>
>>      8390         return rc;
>>      8391 }
> 
> Thank you for reporting this.
> 
> Since this is just a debug print I think it is best to fix this by just
> initializing s to 0 when it is declared and then just log 0
> in the TPACPI_FAN_WR_ACPI_FANW case.
> 
> Anyone got any better suggestions ?
> 
> Regards,
> 
> Hans
> 

Since there is no single value and the registers are always set to
the same static values this would be the right solution in my opinion.

Best regards,
Matthias
