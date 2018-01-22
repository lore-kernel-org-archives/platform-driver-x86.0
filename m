From: Ivan Vecera <ivecera@redhat.com>
Subject: Re: [PATCH] platform/x86: mlx-platform: fix module aliases
Date: Mon, 22 Jan 2018 11:12:18 +0100
Message-ID: <29e4c1ec-ee68-497d-bbac-e6354586bc26@redhat.com>
References: <20180119083156.4082-1-ivecera@redhat.com>
 <87bmhq9g9b.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41784 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751099AbeAVKMU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 05:12:20 -0500
In-Reply-To: <87bmhq9g9b.fsf@miraculix.mork.no>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
Cc: platform-driver-x86@vger.kernel.org, vadimp@mellanox.com

On 19.1.2018 13:37, Bjørn Mork wrote:
> Ivan Vecera <ivecera@redhat.com> writes:
> 
>> Missing prefix 'pn' in MODULE_ALIAS lines causes that the module is
>> not loaded automatically. The patch changes them so they match
>> the entries in mlxplat_dmi_table where BOARD_VENDOR and PRODUCT_NAME
>> are used.
>>
>> Fixes: 6613d18e9038 ("platform/x86: mlx-platform: Move module from arch/x86")
>> Cc: Vadim Pasternak <vadimp@mellanox.com>
>> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
>> ---
>>  drivers/platform/x86/mlx-platform.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
>> index 504256c3660d..b1a5bbe4acf0 100644
>> --- a/drivers/platform/x86/mlx-platform.c
>> +++ b/drivers/platform/x86/mlx-platform.c
>> @@ -370,8 +370,8 @@ module_exit(mlxplat_exit);
>>  MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
>>  MODULE_DESCRIPTION("Mellanox platform driver");
>>  MODULE_LICENSE("Dual BSD/GPL");
>> -MODULE_ALIAS("dmi:*:*Mellanox*:MSN24*:");
>> -MODULE_ALIAS("dmi:*:*Mellanox*:MSN27*:");
>> -MODULE_ALIAS("dmi:*:*Mellanox*:MSB*:");
>> -MODULE_ALIAS("dmi:*:*Mellanox*:MSX*:");
>> -MODULE_ALIAS("dmi:*:*Mellanox*:MSN21*:");
>> +MODULE_ALIAS("dmi:*:pnMSN24*:*:rvnMellanoxTechnologies*:");
>> +MODULE_ALIAS("dmi:*:pnMSN27*:*:rvnMellanoxTechnologies*:");
>> +MODULE_ALIAS("dmi:*:pnMSB*:*:rvnMellanoxTechnologies*:");
>> +MODULE_ALIAS("dmi:*:pnMSX*:*:rvnMellanoxTechnologies*:");
>> +MODULE_ALIAS("dmi:*:pnMSN21*:*:rvnMellanoxTechnologies*:");
> 
> Strange.  Why do so many dmi drivers depend on such long and fragile
> lists of aliases instead of simply using
> 
>  MODULE_DEVICE_TABLE(dmi, ..);
> 
> like most other drivers do?  Is there something wrong with file2alias?
> If so, then I believe it would be better to fix that instead.
> 
> 
> Bjørn
> 
Good note, will re-send.

Ivan
