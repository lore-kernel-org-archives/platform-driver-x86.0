Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EEFC433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 15:10:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28A74610FA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Apr 2021 15:10:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbhD0PK6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Apr 2021 11:10:58 -0400
Received: from mail.dweer.net ([46.4.111.123]:34352 "EHLO mail.dweer.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235974AbhD0PK6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Apr 2021 11:10:58 -0400
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Apr 2021 11:10:57 EDT
Received: from [192.168.178.85] (p5dd5d33f.dip0.t-ipconnect.de [93.213.211.63])
        by mail.dweer.net (mail daemon) with ESMTPSA id 9696E3680257;
        Tue, 27 Apr 2021 15:02:59 +0000 (UTC)
To:     Hans de Goede <hdegoede@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>, thomas@t-8ch.de
From:   Jan Kneschke <jan@kneschke.de>
Subject: gigabyte-wmi: smbus over wmi?
Cc:     platform-driver-x86@vger.kernel.org
Message-ID: <f351a63b-90f8-27a4-d6ca-d569e2b733c2@kneschke.de>
Date:   Tue, 27 Apr 2021 17:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.3 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

the new gigabyte-wmi driver only works only for a subset of current boards.

For boards with two ITE chips like the X570 AORUS ULTRA the 
corresponding functions on the WMBB method are just not handled:


   ...
   ElseIf (((Arg1 >= 0x0118) && (Arg1 <= 0x0121))) {}
   // GET_TEMP is 0x125.
   ElseIf ((Arg1 == 0x012C)) {}
   ...

One way to handle other gigabyte boards may be using the smbus functions 
that are exposed through ACPI:

$ sudo cat 
/sys/bus/wmi/drivers/wmi-bmof/05901221-D566-11D1-B2F0-00A0C9062910/bmof 
| bmf2mof

...
   [WmiMethodId(98)] void SMBQuickWrite([in] uint8 bus, [in] uint8 addr, 
[out] GSA1_ret32 ret);
   [WmiMethodId(99)] void SMBQuickRead([in] uint8 bus, [in] uint8 addr, 
[out] GSA1_ret32 ret);
   [WmiMethodId(100)] void SMBIoBaseAddr([out] uint16 data);
   [WmiMethodId(101)] void SMBSendByte([in] uint8 bus, [in] uint8 addr, 
[in] uint8 data, [out] GSA1_ret32 ret);
   [WmiMethodId(102)] void SMBReceiveByte([in] uint8 bus, [in] uint8 
addr, [out] GSA1_ret32 ret);
   [WmiMethodId(103)] void SMBWriteByte([in] uint8 bus, [in] uint8 addr, 
[in] uint8 cmd, [in] uint8 data, [out] GSA1_ret32 ret);
   [WmiMethodId(104)] void SMBReadByte([in] uint8 bus, [in] uint8 addr, 
[in] uint8 cmd, [out] GSA1_ret32 ret);
   [WmiMethodId(105)] void SMBWriteWord([in] uint8 bus, [in] uint8 addr, 
[in] uint8 cmd, [in] uint16 data, [out] GSA1_ret32 ret);
   [WmiMethodId(106)] void SMBReadWord([in] uint8 bus, [in] uint8 addr, 
[in] uint8 cmd, [out] GSA1_ret32 ret);
   [WmiMethodId(107)] void SMBBlockWrite([in] uint8 bus, [in] uint8 
addr, [in] uint8 cmd, [in] uint8 data[260], [out] GSA1_ret32 ret);
   [WmiMethodId(108)] void SMBBlockRead([in] uint8 bus, [in] uint8 addr, 
[in] uint8 cmd, [out] GSA1_Buff260 ret);
   [WmiMethodId(109)] void SMBBlockWriteE32B([in] uint8 bus, [in] uint8 
addr, [in] uint8 cmd, [in] uint8 data[260], [out] GSA1_ret32 ret);
...

This time, those methods are wired up in WMBB:

   ElseIf (((Arg1 >= 0x62) && (Arg1 <= 0x6D))) {
     ...
     if (Arg1 == 0x67) { ... SMM2(...); }
     ...
   }

SMM2(bus, addr, ret) locks a mutex SMMB|SMME, calls SMB2(bus, addr, ret) 
to call the low-level, unlocked smbus_write_byte().

   // bus==0x02
   Mutex (SMMB, 0x00)
   OperationRegion (SMBI, SystemIO, 0x0B00, 0x10)

   // bus==0x03
   Mutex (SMME, 0x00)
   OperationRegion (SMG0, SystemIO, 0x0B20, 0x20)

The same pattern repeats for the other smbus methods.

It looks like this should be enough to expose the smbus as /dev/i2c-* 
which calls those WMI functions.

 From there the it87 should be able take over the rest.

Has that been done for other drivers yet? Is that even reasonable?

Bonus:

There are also methods exposed for:

- MEM(Read|Write)(8|16|32)
- PCI(Read|Write)(8|16|32)
- PIO(Read|Write)(8|16|32)

if that's needed for the it87 driver.

regards,
   Jan




