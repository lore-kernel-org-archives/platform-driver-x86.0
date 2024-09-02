Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111FB1A4E7F
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Sep 2024 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725309315; cv=none; b=e8NnQ6SvNC4cDpmWR6lAyahpxIHwYt7VP2gJhoYwjqkWRjYCOlcs3UXgTgg38PCHc6UHid2rUrfluXMCbBybpYQRpipCxAi61jcrNxxK8dASLxNb1Gv332naxJ90e8j/NtCip8/xurOmDN3GiY7wle5EttvDZIZrNwEdz3TZg1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725309315; c=relaxed/simple;
	bh=tbrN8LbFR1iaF8W48y2A72tHiPnkJsHbI2x0PM2Idv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n27BTUtFZKjxm5x+uBo0bvhiH6AfOLlMKndQUqGvAYDHOJMS4DQ9GGIqraxDmITb5eTvK5DHgwF0WuZTYokVSeXyHrUVMx/eAWJjt8uegQLWcSEQOviWyAYq6R3cwMgXEKtboGKKCF+7K8wf0qXBTpwoVVLhMDe4hJnFlwDOOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matthias-fetzer.de; spf=pass smtp.mailfrom=matthias-fetzer.de; dkim=pass (2048-bit key) header.d=matthias-fetzer.de header.i=@matthias-fetzer.de header.b=hC4f7f21; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=matthias-fetzer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matthias-fetzer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matthias-fetzer.de header.i=@matthias-fetzer.de header.b="hC4f7f21"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4WyKzk3fjXz8196;
	Mon,  2 Sep 2024 22:26:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matthias-fetzer.de;
	s=key2; t=1725308818;
	bh=tbrN8LbFR1iaF8W48y2A72tHiPnkJsHbI2x0PM2Idv8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hC4f7f21+vAlDZp3MPiIjdplU2VodzrfDrDSljGFfjR1hMVUTVc+S5RGUTf6aE/sb
	 MLWO4HpXZY1RSoCj5v94l51X8ir1uUafjBzKDMa9ase9XNyGphx2sZR/jtDjILtZyO
	 WfJvDAiHPkZKV4K2dO3hWltk15Llx999BT2Y9VymMfKbyaLKJA0VhcY2+gIgQ429Wi
	 K3vcZen7A2HLxj7ncM5Nfa5WjcTZ+uCAyvNRIjaUx6YYCjbXHs8zTftTMI7wGlEEeE
	 rCZoyg9Cuk9IPwQnLaJ9rKJhHSE+KwFtkdp6dfrLatCrNcGO4ceHHgr18y4ykO87OA
	 mhFQdWxeMRxrw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4WyKzk3GJjz8185;
	Mon,  2 Sep 2024 22:26:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxf9a3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4WyKzj6YQqz8t3r;
	Mon,  2 Sep 2024 22:26:57 +0200 (CEST)
Received: from [IPV6:2001:9e8:1a68:ff00:92d4:a8e9:aa9d:d0c7] (unknown [IPv6:2001:9e8:1a68:ff00:92d4:a8e9:aa9d:d0c7])
	by mxf9a3.netcup.net (Postfix) with ESMTPSA id 41A54403FC;
	Mon,  2 Sep 2024 22:26:53 +0200 (CEST)
Authentication-Results: mxf9a3;
        spf=pass (sender IP is 2001:9e8:1a68:ff00:92d4:a8e9:aa9d:d0c7) smtp.mailfrom=kontakt@matthias-fetzer.de smtp.helo=[IPV6:2001:9e8:1a68:ff00:92d4:a8e9:aa9d:d0c7]
Received-SPF: pass (mxf9a3: connection is authenticated)
Message-ID: <f6f5a75d-5014-49be-a82d-d8d4b5192e3b@matthias-fetzer.de>
Date: Mon, 2 Sep 2024 22:26:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531
 fan support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain>
 <9566460c-4d0f-4ead-9fa1-a265c936c3d9@redhat.com>
Content-Language: en-US, de-DE
From: Matthias Fetzer <kontakt@matthias-fetzer.de>
In-Reply-To: <9566460c-4d0f-4ead-9fa1-a265c936c3d9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <172530881360.9817.6846746757369412346@mxf9a3.netcup.net>
X-Rspamd-Queue-Id: 41A54403FC
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: TP8/fUrpMTPm1iwpCxQEkFNKw9CA0u2LZmPiYaPLyaVcc36wqZ4QcuPG

Hi Hans,

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
> 

Since there do not seem to be any other suggestions I'll fix it that
way.
Shall I make a completely new patch for this since it is already on your
review branch or would a fixed v5 be enough?

Best regards,
Matthias
