Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDFA50;
	Sun, 29 Dec 2024 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735432014; cv=none; b=XdHf8iz83xHlJ1KtQ6K1VqsgOWRJcCDQSVsFNXAGlnmNCafA4UfO9slYbAU6ZbZhivYHBcb26OIz8gf4UNI16+gqHoqaIqPltNmRCT2gQsGGZuqSw2UXml+pNk+u+LiVr/HGdvEClTYPSgykNHyep27NA5zgmnZrcxzrxFVV7Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735432014; c=relaxed/simple;
	bh=VKxYsK6oHKz7glJwFl56JlxrA00oEu/c1ZRf+2baF0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FHI3d0/jZdQcWAGyQbJPOAwdSVtSLyMBo5a/YCkSwhZ/DwAHMA7p/w47ZEKjv41MW2R9u3g/87776ZwIdt8enP+fIth3FPOvK0uzy+FI+AQ/2tP4FugHJKv44mF77c+UIrnAZacMf84cPMZXGVNM8mnTFcWUlJM2hrV03gmTxtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mbSJUFQG; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mbSJUFQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735431998; x=1736036798; i=w_armin@gmx.de;
	bh=B4rTpWa5nfj8ZJHAw2qHMiLr31f++q8Z4Pl2xA/1jBM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mbSJUFQGUiukGHlasnPGR6Fhfm5dW4QK42eztQr8I1EOdbcUKrnhPXhf+tX8GwxJ
	 N7zgZX/i/jhxNzGVE0M2LLTnmppMX/BvI5/8fC6L+3+rlRKMOMUww0EpjN8wZQDkk
	 cBTtyQx6pHlGMgtcocP11hiuxv52SBrntF62E4uT/yotIBDlAiQpJrFa5suGBzz3U
	 jR2yEcIWT9Vh3OOJc1uefGdfh6jE9T1iCNoxuLFs8h79oLFt1psbzIGN+Pqatipxb
	 kY0oTcZ4S3WVhPS7celPEvBRUkLNYfefCxX++9Gw6kOR8PFmzn1DonoJ7XCLjXQ3A
	 waC9KoL4PpYIQ6I4hg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGRK-1tBoBH3xtW-00IXoW; Sun, 29
 Dec 2024 01:26:38 +0100
Message-ID: <6a99fe08-f1eb-4101-99bf-db5fa7364680@gmx.de>
Date: Sun, 29 Dec 2024 01:26:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] alienware-wmi: Add WMI Drivers
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-9-kuurtb@gmail.com>
 <367b6e24-d7d3-426e-96ed-e7ab6a36ad5b@gmx.de>
 <zl6ukxdcscxqkpqodjkocfljolnoz2pep74zbu2iy5e7itm3lr@zavcqwt5iyaw>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <zl6ukxdcscxqkpqodjkocfljolnoz2pep74zbu2iy5e7itm3lr@zavcqwt5iyaw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:a7WAkk2snP9RhxLGSKw4qfUK1S7z0tzqQxjNQl0ZZIGOgZjJ8/m
 KxHR7u8XxOQMi1NpvZyUQo2uOestqS+/UUORyqLXVCunN18WFkU0Dg77xGJ9/rK6NGQXTrl
 CjEoYpLNPzEgefFlzyH6ZTNE3dg7qs+WIclYfdw6Vg8D/S7aJkGOasbJPCIKght70f9cy7b
 79A3GQNfKjsxHz7OgqrWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p9PLOpo17vE=;mWAIHinAfz5QM5WvTshWUF7HgPg
 dbTcbwCAU/Rqc8e1by/BnH00E7JyyQ2QeM6+0meVb4XyFDlgOpflWUdtupTvx7r5LcfXJexxa
 MS8aFFeWjt2rF6IopjSrGYNqD7Ild1Jgk9tbk5bVnmtROA7ZykyJNJ+jPB/wXqmOe31vWp+Kl
 LagAU5caTsYLINjmmSoebdNpHGOTKG7IueQsqLxAFMvOTchJnOGzmOEKD3rKGsMF96L5t85sA
 VwpZ2U1vejkxv6G0FNBUzlhhaEqg2EirtnxoielEgl7QlxUv4Mk3hlhLgw+f84/+FhN6fe639
 8QC1PUFCxGawiBBPYglSrJRW+bInZoh1prroz7N9WDdhIkmqHOr+ksXD96eZLuIueyI3TvYq+
 ciMWFDPgP6zX7tTyMrc+PL1ZQdm7CqxG1A7oVyw6Wj5ciK/E/8MGdG1BT9lBL2+lmmTlUzEG8
 EI5vZrSseYrVlREW76jnfKg89YSuNUhuuVT/oBZL4R/cXsOL+WSUem/hoWvBS1VbhYeTKe9xF
 Jkd6w/4EOt7nnMfAmj6Bc0QT1RyEcF5/1RH+ogOZbsyzViEFsWN4PeaACQMAll7W/dOm4qvfy
 ZLPZflEuAO5W19B5w4CK7aZQjk5qB8Fb1NfFQwWj9ge1LepqYvCFrs9NtAWsSoFYW1h600qSh
 pgnl9DNJ7CpJ0LVwyXzAl9NYNxGvQrm8TLgHqfGQYxa5Mmu1MJbx3rkLOKVJhKgqhuK5IQc0I
 GV2ysaSbJLfvHnIeNSEj26iejv/s3+ZkISknhf921pBd2aZW1bymFp/I69SBe5LGj7NHVQobV
 jckAgFRY/ZhDQNRd8S+7nH8R3jth9tJL9Z5zi7/4EHXlhLexY/demB4oJcQBlUaClxEBq7ovz
 ZESN5+WGy8fC6tX9GjZvTOOm/tW7cVA8BY+bja+mcsoh/9hsJgBuvxEB64PoNYgPRikFacnka
 iazaJqQ9khdNp7AV1JOMiNkYnw9ApzaOkrgAbgKl4TV7bw6s1vwpHU+7IdSqXU53P7seGtrQA
 2IvN7jRHMtrezsaZfLzH/60I1tuAJpEy/jcgLSt06aELilLWZKF6Z0ZfpebqgxQylBjPDcmgO
 WvzGjD/CvaIwacs527/8gAF6VJEYkn

Am 27.12.24 um 05:44 schrieb Kurt Borja:

> On Fri, Dec 27, 2024 at 04:21:14AM +0100, Armin Wolf wrote:
>> Am 21.12.24 um 06:59 schrieb Kurt Borja:
>>
>>> Add WMI drivers for LEGACY and WMAX devices.
>>>
>>> This involves moving platform driver and device registration to a helper
>>> function, which is now called from the driver's preferred WMI device
>>> driver probe. However this is only done if !quirks->thermal because
>>> newer WMAX interface doesn't support any of the features exposed by this
>>> device.
>>>
>>> Only one driver is registered on module initialization to prevent
>>> registering duplicate platform driver and device.
>>>
>>> Aditionally, create_thermal_profile() now takes wmi_device * instead of
>>> platform_device *.
>> Since the HDMI, Amplifier and deepslp groups depend on the WMAX interface i would
>> register them inside wmax_wmi_probe() using device_add_groups() (you might need to
>> rework alienware_alienfx_setup() for that).
>>
>> In the end the only code shared between both drivers should be related to the LED handling.
>> Everything else AFAIK depends on the WMAX interface and should therefore be inside the
>> WMAX driver.
> Unfortunately this breaks old user-space interface, as the path to this
> attributes would change :(. This is why I can't even set a parent dev
> for the platform_device.
>
> I only know of one project which interefaces with this driver [1], and
> it does use the /sys/devices/platform/alienware-wmi path. Maybe I could
> send a pull req, but it would still break old unknown projects and
> scripts.
>
> [1] https://crates.io/crates/alienware

I meant that you use device_add_groups() on the platform device, not on the WMI device itself.
Since alienware_alienfx_setup() stores a pointer to the platform device using dev_set_drvdata() the WMI driver
can use dev_get_drvdata() to access the platform device.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/dell/alienware-wmi.c | 186 +++++++++++++++++-----
>>>    1 file changed, 146 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
>>> index 4b68d64bd742..f2f6842e27e6 100644
>>> --- a/drivers/platform/x86/dell/alienware-wmi.c
>>> +++ b/drivers/platform/x86/dell/alienware-wmi.c
>>> @@ -15,6 +15,7 @@
>>>    #include <linux/platform_profile.h>
>>>    #include <linux/dmi.h>
>>>    #include <linux/leds.h>
>>> +#include <linux/wmi.h>
>>>
>>>    #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
>>>    #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
>>> @@ -39,8 +40,6 @@
>>>    MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>>>    MODULE_DESCRIPTION("Alienware special feature control");
>>>    MODULE_LICENSE("GPL");
>>> -MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
>>> -MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
>>>
>>>    static bool force_platform_profile;
>>>    module_param_unsafe(force_platform_profile, bool, 0);
>>> @@ -412,7 +411,10 @@ struct alienfx_priv {
>>>    	u8 lighting_control_state;
>>>    };
>>>
>>> -static struct platform_device *platform_device;
>>> +struct alienfx_platdata {
>>> +	struct wmi_device *wdev;
>>> +};
>>> +
>>>    static struct platform_profile_handler pp_handler;
>>>    static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
>>>
>>> @@ -1048,7 +1050,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>>>    	return wmax_thermal_control(supported_thermal_profiles[profile]);
>>>    }
>>>
>>> -static int create_thermal_profile(struct platform_device *platform_device)
>>> +static int create_thermal_profile(struct wmi_device *wdev)
>>>    {
>>>    	enum platform_profile_option profile;
>>>    	enum wmax_thermal_mode mode;
>>> @@ -1097,7 +1099,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
>>>    	pp_handler.profile_get = thermal_profile_get;
>>>    	pp_handler.profile_set = thermal_profile_set;
>>>    	pp_handler.name = "alienware-wmi";
>>> -	pp_handler.dev = &platform_device->dev;
>>> +	pp_handler.dev = &wdev->dev;
>>>
>>>    	return platform_profile_register(&pp_handler);
>>>    }
>>> @@ -1153,19 +1155,138 @@ static struct platform_driver platform_driver = {
>>>    	.probe = alienfx_probe,
>>>    };
>>>
>>> -static int __init alienware_wmi_init(void)
>>> +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
>>>    {
>>> +	struct platform_device *pdev;
>>>    	int ret;
>>>
>>> -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
>>> -		interface = LEGACY;
>>> -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
>>> -		interface = WMAX;
>>> -	else {
>>> -		pr_warn("alienware-wmi: No known WMI GUID found\n");
>>> -		return -ENODEV;
>>> +	ret = platform_driver_register(&platform_driver);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	pdev = platform_device_register_data(NULL, "alienware-wmi",
>>> +					     PLATFORM_DEVID_NONE, pdata,
>>> +					     sizeof(*pdata));
>>> +
>>> +	if (IS_ERR(pdev)) {
>>> +		platform_driver_unregister(&platform_driver);
>>> +		return PTR_ERR(pdev);
>>>    	}
>>>
>>> +	dev_set_drvdata(&pdata->wdev->dev, pdev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void alienware_alienfx_exit(struct wmi_device *wdev)
>>> +{
>>> +	struct platform_device *pdev;
>>> +
>>> +	pdev = dev_get_drvdata(&wdev->dev);
>>> +
>>> +	platform_device_unregister(pdev);
>>> +	platform_driver_unregister(&platform_driver);
>>> +}
>>> +
>>> +/*
>>> + * Legacy WMI driver
>>> + */
>>> +static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
>>> +{
>>> +	struct alienfx_platdata pdata = {
>>> +		.wdev = wdev,
>>> +	};
>>> +
>>> +	return alienware_alienfx_setup(&pdata);
>>> +}
>>> +
>>> +static void legacy_wmi_remove(struct wmi_device *wdev)
>>> +{
>>> +	alienware_alienfx_exit(wdev);
>>> +}
>>> +
>>> +static struct wmi_device_id alienware_legacy_device_id_table[] = {
>>> +	{ LEGACY_CONTROL_GUID, NULL },
>>> +	{ },
>>> +};
>>> +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
>>> +
>>> +static struct wmi_driver alienware_legacy_wmi_driver = {
>>> +	.driver = {
>>> +		.name = "alienware-wmi-alienfx",
>>> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>> +	},
>>> +	.id_table = alienware_legacy_device_id_table,
>>> +	.probe = legacy_wmi_probe,
>>> +	.remove = legacy_wmi_remove,
>>> +};
>>> +
>>> +static int __init alienware_legacy_wmi_init(void)
>>> +{
>>> +	return wmi_driver_register(&alienware_legacy_wmi_driver);
>>> +}
>>> +
>>> +static void __exit alienware_legacy_wmi_exit(void)
>>> +{
>>> +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
>>> +}
>>> +
>>> +/*
>>> + * WMAX WMI driver
>>> + */
>>> +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
>>> +{
>>> +	struct alienfx_platdata pdata = {
>>> +		.wdev = wdev,
>>> +	};
>>> +	int ret = 0;
>>> +
>>> +	if (quirks->thermal)
>>> +		ret = create_thermal_profile(wdev);
>>> +	else
>>> +		ret = alienware_alienfx_setup(&pdata);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void wmax_wmi_remove(struct wmi_device *wdev)
>>> +{
>>> +	if (quirks->thermal)
>>> +		remove_thermal_profile();
>>> +	else
>>> +		alienware_alienfx_exit(wdev);
>>> +}
>>> +
>>> +static struct wmi_device_id alienware_wmax_device_id_table[] = {
>>> +	{ WMAX_CONTROL_GUID, NULL },
>>> +	{ },
>>> +};
>>> +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
>>> +
>>> +static struct wmi_driver alienware_wmax_wmi_driver = {
>>> +	.driver = {
>>> +		.name = "alienware-wmi-wmax",
>>> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>> +	},
>>> +	.id_table = alienware_wmax_device_id_table,
>>> +	.probe = wmax_wmi_probe,
>>> +	.remove = wmax_wmi_remove,
>>> +};
>>> +
>>> +static int __init alienware_wmax_wmi_init(void)
>>> +{
>>> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
>>> +}
>>> +
>>> +static void __exit alienware_wmax_wmi_exit(void)
>>> +{
>>> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
>>> +}
>>> +
>>> +static int __init alienware_wmi_init(void)
>>> +{
>>> +	int ret;
>>> +
>>>    	dmi_check_system(alienware_quirks);
>>>    	if (quirks == NULL)
>>>    		quirks = &quirk_unknown;
>>> @@ -1180,43 +1301,28 @@ static int __init alienware_wmi_init(void)
>>>    			pr_warn("force_gmode requires platform profile support\n");
>>>    	}
>>>
>>> -	ret = platform_driver_register(&platform_driver);
>>> -	if (ret)
>>> -		goto fail_platform_driver;
>>> -	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
>>> -	if (!platform_device) {
>>> -		ret = -ENOMEM;
>>> -		goto fail_platform_device1;
>>> +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
>>> +		interface = WMAX;
>>> +		ret = alienware_wmax_wmi_init();
>>> +	} else {
>>> +		interface = LEGACY;
>>> +		ret = alienware_legacy_wmi_init();
>>>    	}
>>> -	ret = platform_device_add(platform_device);
>>> -	if (ret)
>>> -		goto fail_platform_device2;
>>>
>>> -	if (quirks->thermal) {
>>> -		ret = create_thermal_profile(platform_device);
>>> -		if (ret)
>>> -			goto fail_prep_thermal_profile;
>>> -	}
>>> +	if (ret < 0)
>>> +		return ret;
>>>
>>>    	return 0;
>>> -
>>> -fail_prep_thermal_profile:
>>> -	platform_device_del(platform_device);
>>> -fail_platform_device2:
>>> -	platform_device_put(platform_device);
>>> -fail_platform_device1:
>>> -	platform_driver_unregister(&platform_driver);
>>> -fail_platform_driver:
>>> -	return ret;
>>>    }
>>>
>>>    module_init(alienware_wmi_init);
>>>
>>>    static void __exit alienware_wmi_exit(void)
>>>    {
>>> -	remove_thermal_profile();
>>> -	platform_device_unregister(platform_device);
>>> -	platform_driver_unregister(&platform_driver);
>>> +	if (interface == WMAX)
>>> +		alienware_wmax_wmi_exit();
>>> +	else
>>> +		alienware_legacy_wmi_exit();
>>>    }
>>>
>>>    module_exit(alienware_wmi_exit);
