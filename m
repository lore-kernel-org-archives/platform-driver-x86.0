From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH RFT] platform/x86: intel_pmc_ipc: Convert to use platform_device_register_full
Date: Tue, 27 Sep 2016 08:24:35 +0800
Message-ID: <CAFRkauBo05oeuGTaCAz0GejZR5aOvMxFQjPBU-3aUFZ8DzWNVw@mail.gmail.com>
References: <1474689248-5925-1-git-send-email-axel.lin@ingics.com> <becb6cab-7060-7227-f9d9-0209437c807f@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:36797 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753844AbcI0AYh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Sep 2016 20:24:37 -0400
Received: by mail-qk0-f194.google.com with SMTP id m184so4770016qkb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2016 17:24:36 -0700 (PDT)
In-Reply-To: <becb6cab-7060-7227-f9d9-0209437c807f@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Li, Aubrey" <aubrey.li@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org

2016-09-27 7:21 GMT+08:00 Li, Aubrey <aubrey.li@linux.intel.com>:
> On 2016/9/24 11:54, Axel Lin wrote:
>> Use platform_device_register_full() instead of open-coded.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>>  drivers/platform/x86/intel_pmc_ipc.c | 110 +++++++++++------------------------
>>  1 file changed, 33 insertions(+), 77 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
>> index b86e1bc..665a9a1 100644
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -522,48 +522,36 @@ static struct resource telemetry_res[] = {
>>  static int ipc_create_punit_device(void)
>>  {
>>       struct platform_device *pdev;
>> -     int ret;
>> -
>> -     pdev = platform_device_alloc(PUNIT_DEVICE_NAME, -1);
>> -     if (!pdev) {
>> -             dev_err(ipcdev.dev, "Failed to alloc punit platform device\n");
>> -             return -ENOMEM;
>> -     }
>> -
>> -     pdev->dev.parent = ipcdev.dev;
>> -     ret = platform_device_add_resources(pdev, punit_res_array,
>> -                                         ARRAY_SIZE(punit_res_array));
>> -     if (ret) {
>> -             dev_err(ipcdev.dev, "Failed to add platform punit resources\n");
>> -             goto err;
>> -     }
>> +     const struct platform_device_info pdevinfo = {
>> +             .parent = ipcdev.dev,
>> +             .name = PUNIT_DEVICE_NAME,
>> +             .id = -1,
>> +             .res = punit_res_array,
>> +             .num_res = ARRAY_SIZE(punit_res_array),
>> +             };
>> +
>
> Is it better to move the structure out of the routine?

Either is fine.

The struct platform_device_info is not very big as most of it's fields are
pointers. And this variable is for setup only so it's fine to use
local variable,
we don't need it once the function is done.
