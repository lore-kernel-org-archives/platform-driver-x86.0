Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383A8C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 20:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjCVUp3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 16:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjCVUpL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 16:45:11 -0400
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F3A60A8B
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 13:39:58 -0700 (PDT)
Received: from [192.168.0.31] (51b68d67.dsl.pool.telekom.hu [::ffff:81.182.141.103])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070A53.00000000641B679A.001566BC; Wed, 22 Mar 2023 21:39:54 +0100
Message-ID: <ba4e7835-9c13-89dc-cd3f-80ca90024639@irl.hu>
Date:   Wed, 22 Mar 2023 21:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <85e87867-5001-da05-dd7c-020977c75288@irl.hu>
 <CAG4kvq8=nHL49_U6=fc0eNPptzX-deXvg=XnmgKC1cAMHP3iMQ@mail.gmail.com>
Content-Language: en-US, hu
From:   Gergo Koteles <soyer@irl.hu>
In-Reply-To: <CAG4kvq8=nHL49_U6=fc0eNPptzX-deXvg=XnmgKC1cAMHP3iMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andrew,

On 2023. 03. 21. 3:14, Andrew Kallmeyer wrote:
> On Mon, Mar 20, 2023 at 6:05 PM Gergo Koteles <soyer@irl.hu> wrote:
>>
>> Hi Andrew,
>>
>> Thanks for picking this up. Sorry for the late reply.
>> I no longer think this driver should do the same workaround as ymc.exe
>> does, it shouldn't make non-WMI calls.
>> I think the 14ARB7 should be fixed in the BIOS to work like the other
>> Yogas with the same WMI IDs.
>>
>> So PATCH 1/2 and codes related to ec_trigger are unnecessary.
>>
>> I only have the 14ARB7 and I can't test this without the ec_trigger.
>> For this reason, I don't want to be the author of this module.
>> Could you be the author?
>>
>> The working C940, 14API reports are from
>> https://github.com/lukas-w/yoga-usage-mode module, which uses the same
>> WMI IDs.
>>
>> Regards,
>> Gergo
>>
>> Co-developed-by: Gergo Koteles <soyer@irl.hu>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> 
> Hi Gergo, happy to hear from you!
> 
> Now it makes sense why this never got submitted. I suppose the 0xAB
> method ID came from decompiling that ymc.exe as well? It looks like
> the github repo uses 0x01 which is what we found in the acpidump.
> 

I didn't decompile the ymc.exe, just watched the acpi/wmi trace logs, 
while stopped and started the ymc service, and figured out what it can 
do. After mode changes I saw the VPCW,VPCW,VPCR pattern, what I saw 
before in the ideapad-laptop.c as write_ec_cmd. Then tried with the 
unknown cmds, and the 0x2A worked.

The 0xAB came from the object_id of debug_dump_wdg by mistake.

[    1.562801] wmi: 09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C:
[    1.562802] wmi: 	object_id: AB
[    1.562803] wmi: 	instance_count: 1
[    1.562804] wmi: 	flags: 0x2 ACPI_WMI_METHOD

The correct one is the 0x01 here also.

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), 
Description("LENOVO_GSENSOR_DATA class"), 
guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
class LENOVO_GSENSOR_DATA {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, Description("Mode Data")] void 
GetUsageMode([out, Description("Mode Data")] uint32 Data);
   [WmiMethodId(2), Implemented, Description("Get Xaxis Value")] void 
GetXaxisValue([out, Description("Get Xaxis Value")] uint32 Data);
   [WmiMethodId(3), Implemented, Description("Get Yaxis Value")] void 
GetYaxisValue([out, Description("Get Yaxis Value")] uint32 Data);
   [WmiMethodId(4), Implemented, Description("Get Zaxis Value")] void 
GetZaxisValue([out, Description("Get Zaxis Value")] uint32 Data);
   [WmiMethodId(5), Implemented, Description("Base to Ground")] void 
GetAngle4Value([out, Description("Base to Ground")] uint32 Data);
   [WmiMethodId(6), Implemented, Description("Screen to Ground")] void 
GetAngle5Value([out, Description("Screen to Ground")] uint32 Data);
   [WmiMethodId(7), Implemented, Description("Screen to Base")] void 
GetAngle6Value([out, Description("Screen to Base")] uint32 Data);
};

It works with any id
Method (WMAB, 3, NotSerialized)
{
    Return (^^PCI0.LPC0.EC0.YGAM) /* \_SB_.PCI0.LPC0.EC0_.YGAM */
}


I've found one thing, in this line

priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VCP2004", NULL, -1);

the correct hw id is "VPC2004", not "VCP2004".

With this modification, it works well.


> I will remove that code like you say, make myself the module author,
> and add your Co-developed-by and Signed-off-by tags to the commit.

According to Hans, it's unrealistic that Lenovo will change this 
triggering behavior, so it can remain.

Thanks,
Gergo

> 
> Thanks,
> Andrew

