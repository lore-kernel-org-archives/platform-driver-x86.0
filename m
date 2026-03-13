Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FEAAD4B
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773438331; cv=fail; b=hzT6Jmida3egJHvQNxu1SNxsQEeFIntCzD0QuLE/5xwNuZi8frr6e8j7TPBviIE7G106/NhDzeO9O6YbatG2XTCya0UAQgA4MUth8pUYeGYlUR1dljBhM9TCxc4wLClUDeexnSDiePUZitddkzuGTQEo2u2qxx/RJdOZOJndZz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773438331; c=relaxed/simple;
	bh=ZnR5JkMrqiU4Ve3ShevdSZM2IxNd79UT7B2IGA+32Pc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l42qF/FQ0cjWC90sdBGsAUfm67NHYRyGMVMykEXQVxu9ZVi9WnKUl7mFARud32rVKScc4Zgf6abIE74Z8IpJ1kyaqN8bQjXyhzf31KVi/qpazgV8Oqy8QSs6nZAGPQ8vouJRLRXCbPDweFFRlysEZgw4R2rSjpdygiX1gVFhkCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5fuA+QJ2; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5fuA+QJ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTb2hCqToXJDwwNEXhZDsPNvwn9Grl5q39Rax59silocRRnWKp7gc718w13HcvbCM+qpfY5u5k1wqatV8THRF8zv36/8gJ+Q0N5yx51wQkOophkbjkfAI+O+otC6C4WJZrk8fD4X5plga4K++8Sb6lLYCnr/+cxISTM7x0lk3GmH1Us5mF/pSgaYfql9OvYOR1KoxQ4DF9v3Q12mLqx3vZoOZX0Yy58Z2iLsgOhtgOiPWzUUb2xdN/tCqp7hRoUorMioUUMLpSS+Qeukvgw6yzDAx4umqgYhAUxNoex5n0QZFjTopKSaOGZu+jTzZriwLjSEbmIZUdZNwbfc3DVUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugqC4+pSzhM5YZnsfpA13tHDVLY2oHTZxhO1ZYrsies=;
 b=mprrVYtgeGmDpiL0LqaeoDMayNFqnBqMaz8EGsmbqE1DTsqJMuzzVTTvWTCxOm+Z1m/b0HVW+5O68FXrmHKJp7gn/5Q/zgZ5R9yom5iyvkhKNadhUFIpNod74x8HUcOJ2I0Fe+085yfoEYCFm4i4rPKEo7L2O6tKiJ850P7j/vmgJsvtI1hIWc4jGXQFTTIpHAoW4zOjC5BTz9eaqLmBs55zskTx/QpFmxYK6OQyMIWE7/1Nyb0m9np91lmC5tn+2qzlYzr7+U8BedgI4NhhU9Djom/a5ET8UiYqWam/ebstGuI74/4QrWjzyocWJ4g6BAMGDxGugSSbh6lD3vOHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugqC4+pSzhM5YZnsfpA13tHDVLY2oHTZxhO1ZYrsies=;
 b=5fuA+QJ2020avKZGGJ+ep5yFKVVAeEZR2YlUG1ytoRg0aXLQPko2BgVqrKsLxZZTLyYCrTX0y3JcqZoXei+lUBivM8RXmVbIh5cDMGRbFtXcPKJSHQv8jUgMHQg4L/DE/JtN9z8qq09XgNtn+UCYfB507fIj68L8lG5sttMycu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 21:45:27 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 21:45:27 +0000
Message-ID: <50cc3d4b-5e5a-422c-9abd-556488710988@amd.com>
Date: Fri, 13 Mar 2026 16:45:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH]: asus_wmi: Unknown key code 0x6d
To: Jonathan Grant <jg@jguk.org>, platform-driver-x86@vger.kernel.org,
 luke@ljones.dev
Cc: hdegoede@redhat.com
References: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:610:52::32) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: c235979a-bc43-40cd-2952-08de8149d6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IkwKd20zvsFFnTAi83G/X9xN3km7oRSynvardUObQKGmCk3lgjUyIwGinSNBphh9o0FW1XU9rKIygtzaZzuAT/dkWf7NNGzfDkvEAtDab8oFVhtbNxQeAWW4/fmSQHdDKSC6ZtUlKJXsBt4AB3iygB9tDlUDalS5+pG5HvPXnhJbBBQh8r+/rix7naZw6Fn6gGdDXcO41PKUNWaBPpOSFzxSBJSPXcnUYoCKF/AFvvm7fvxk2B5KGX/QbinYLJRm6PyRDKkh9dYExhV+nX5qvcVFrDWwDuy82uibs3Py7RiX3rkOwgFNOXHStpDKZOJZD4I4gMGoEVhDXZfxAfmGKtwfQwvPceI/4kr87BPlL6q3I4k8MKSAuzREHnjjvJs9tIXUnrwwfeCG1UsIXaY1r7rPBLh01mr8vxFiO7rNYK1JyagGC68wHhJ0AklVbaNPMgHNB5ocUwMHfh1iDiU5Jp3Lx9OOdu19BAS8Ikeb8gYh/FxL8Eu4SIDV/8bleyWvu25rcYntYQKmmQEWRE8w5E+ZfwgCnl2qqC10gNnsUvUDgPeupAjXG5b5UrqIIMjYoorVlIIoz9UTvzMZRrLnUCkO9s3E6TZMSKp5KRd3rmqEPMQQ9THapjeSacBul65nmxSyA7ewWrYWcAzhSV9TrvjkPN9cfftkNRdfRh7hDYVZ84GOYyY/3ITzMrB+aYo55ASUQINxpl3Wq36Yj+HV1bVgenVmSMuwCleTaVTyj+3hXBxDtk9FsSSw0pfNbWel
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2NLdVlqZG82bmtFRENkdjdTY29UNzJlcEpYRHd2MDBtcUlveCt5NFh0N1M2?=
 =?utf-8?B?cU5oUHY0QUhuZzZDVmlsWU5DTEgvY1ZIZFgyZncrTEcvTkdtR2dQZXhFWnJ4?=
 =?utf-8?B?Z3A1UVJwNnpwV2NxYkM2SUdnNVhBeWowUklpZHM5bGRjZnFIZzJYTWpwQW0x?=
 =?utf-8?B?akhiTVFkYjlDN1gyNGJyeTJRc3JVVmZBZmJZTVVJVlhuQkhzZ3BWcGwxd3VI?=
 =?utf-8?B?MmZ3djlGUldoamFSVTlrWFFRU3lLVXpOVXh6U0h2Z0luZnRiRGdzZHFza2tz?=
 =?utf-8?B?ZzBPQWk1cTlZRW9STGhFdUlYcXJUQW02bytjU3Q2RXU3VGRHQU1ZUDJYOWky?=
 =?utf-8?B?RmwwT2J3TjlsMmVqNThwa2t1RWZsbHJkTkVhckh3RGVGdTFpdWVkK1N1TUVF?=
 =?utf-8?B?MEhsN2RpR245cVE0OEZTRkFOYTZHT2hrMjNDQlpkcnh2a0hwTStqbG91Mlhu?=
 =?utf-8?B?Tm1HbVZmY1o4U3RxZ3Jvekt0c3BtV2JydFZyVHFOZkZ6NlRYRzAzWEZ4d0dB?=
 =?utf-8?B?KzNPdnU1Tm95eGFnOFU4WHlsU1pTTkhPVUFIMUVsRnpySWcvZWw2STFsZHVP?=
 =?utf-8?B?Q0RpQTZJOEtRSXZtTzJwNnpPTFNHNjZtMXBUUmpsbFo0dmdjemVzdnh4WkFu?=
 =?utf-8?B?NlRPNVR6d2RrQ0FlMy8yalg5T0N5WnZtYm9VUW5wZGZuWnRLZEVuWTFXbnpL?=
 =?utf-8?B?U2ZqdWJOeXlIZ3VnQkg3cUh3bXl3b3hPdDdFdjl2SCtteWJMTEd5Yno0cFYw?=
 =?utf-8?B?Ym0vQVo4WDNKTWNLeWh5cXlZakQydmpuUW43TlNVRkZHNytLc1ZkRFgzRFow?=
 =?utf-8?B?eDN1NGluYXJwUzJZejJ3RS9yTFM5c1NlQXN2bVN6MTFHYVhQZUdsTitBZVJB?=
 =?utf-8?B?UVVhY1pHL0VkR1NFSmVYcHZqY25DeG9qeitKbGdHMU4yYnpwK0t1WFh3WUVV?=
 =?utf-8?B?bVRlTUlOcnpkeGZQTU03NDZ2a09YYVFlUnV4Y1U0ZXBCVktqb3QrQ2h4TE42?=
 =?utf-8?B?cnI0R3M2NW13T2FxOUF3dXBITVEyOGpiOEhkYk01cFJNWHpUOXFXSi9ISytV?=
 =?utf-8?B?cGkxNWtWSmJ1M0VBYXZCSlNQdlhZNG1WVnVkK2VXT25lZ1pNclhpbCtGOSs3?=
 =?utf-8?B?cVhxSWorY05CMUlZQ3lrblltZWVPTGZXU0kyZjJ4ZXI5a2s4V2s3WEI3cWRa?=
 =?utf-8?B?aUFyRkQ3Wk45eXBHR2pqNlBtS0luRUtYcmVJZ2hrRVpSNU9UTm9zakhQOWx4?=
 =?utf-8?B?NEl6UU1UcEpUZisvTjV5Q3R2dm52YVNxQVdaaXJIamgwMDFmbHRpNGxITGQ2?=
 =?utf-8?B?SmxVVm9Fc0Y4V3BNSDNJZ1ZlbkRWaWFzUFlJZ3R2R3RPMnM4MnU0djF1Q3Bj?=
 =?utf-8?B?enU1TURJZ2VpVENtZWZackdzUkdqSExOWmh5bUZNZU8yQVNhT0hUaWN2SnFP?=
 =?utf-8?B?L2tJbWt6T0I1ZnNvMGxZMCt6SmxYWnhWVDNzZlA3THg3TVJPNjZ1cm1NRjlX?=
 =?utf-8?B?TExEZEVmL3BUK0VxMU5UMlhTczZNU1FDaUpOT2hqZjd5MFcwMmhqNy9jYkJz?=
 =?utf-8?B?a25mUS91bjRCeHZ5UlYvbkx2d3ZNTWliS0dQcEhZRFJCWU9vNDNnckU2VE9Y?=
 =?utf-8?B?VU55UHEvT2F5ZGc5Y1VVY0FaU1FFTk9OV21zZkNwV1NUcGVoeWhwSGZyUUVO?=
 =?utf-8?B?eVc5ajBqSHJNZTF6UkszczhuVWVKcnJkcDVuVHZHNDAxS1FmcHpMdWplZ2x6?=
 =?utf-8?B?OHluTThhY3g2c0xLNC9GaDEvdXVNWmd6bXluUUdBQ2tTZFBJcldUSUxpN0hG?=
 =?utf-8?B?ZERYcDZ1eGpHbWZkbkRRU0JZOHpWWXRMZWZXc0JySUJVa09VOUNYUkFRRXkz?=
 =?utf-8?B?dlhLOHVJTE9XNUFhRmFkQTVBZ0E5WXhlZWlFWUt2N041cEZuSEtTQUc4NXBL?=
 =?utf-8?B?TmZJNmxIdmg0ek5ncWtNakVsbEtxQURTSXVBSUd3aDBZcmpzVHlQTk82TVNo?=
 =?utf-8?B?MjY2MU1Da2NYaUgvYjcwTzExUys3bUNzclAzZkd3SlhaRTc1anFTVldQeitV?=
 =?utf-8?B?MFlXK3BVNE9KRG9qQnV2SVpITXNMN0duSUtUU2FFbXJwazNzNEs2TzVXK05m?=
 =?utf-8?B?M1p2eTlnU0hTb0xSTUN6M01MbHRSMVB1a1J5bTRHcHVLYjFwVUp4Tm8xdUdD?=
 =?utf-8?B?MFdSVlNlVnk0aVYzeW9hVmtXTU5oRmlrVDFCclg2WjkyL3JkNldsanBYWjh2?=
 =?utf-8?B?MS9GOHlrQk5JZWJ5Zmo5cDVHamRWMGdadWNKWmJKQXB2Q01uN08yYVJqbEI1?=
 =?utf-8?B?SElIdit5ZC9jeG1ZaU5QRzNWOUdmbjhUc1pjamtxb2NaU3ZwU2NuQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c235979a-bc43-40cd-2952-08de8149d6bc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 21:45:26.9745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TyL5qlhrxIh7zBZwY8GFqi3SgmiVIZakbXza1VhsBcmMH57yHKcGLMJsFay6RghLQeFID4ngDB7NkDpLECaaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352



On 3/13/2026 4:00 PM, Jonathan Grant wrote:
> [You don't often get email from jg@jguk.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Dear Luke D. Jones
> 
> I made the below patch after seeing the following:
> 
> asus_wmi: Unknown key code 0x6d
> 
> It is just before my laptop overheats and powers off. (eg if I do make -j8)
> 
> May I ask if it could be reviewed?
> 
> Kind regards
> Jonathan

Hi Jonathan,

The guide for submitting patches is here: 
https://www.kernel.org/doc/html/v7.0-rc3/process/submitting-patches.html. 
  Please review it and pay particular attention to the need for a DCO 
(Signed-off-by) and how to write a commit message for your patch.

Thanks,

> 
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7c0915e097ba..06438b4e7a17 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>   #define NOTIFY_KBD_TTP                 0xae
>   #define NOTIFY_LID_FLIP                        0xfa
>   #define NOTIFY_LID_FLIP_ROG            0xbd
> +#define NOTIFY_POWER_OFF               0x6d
> 
>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED  BIT(0)
> 
> @@ -4596,6 +4597,11 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>          if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
>                  return;
> 
> +       if (code == NOTIFY_POWER_OFF) {
> +               pr_info("Power off\n");
> +               return;
> +       }
> +
>          if (!sparse_keymap_report_event(asus->inputdev, code,
>                                          key_value, autorelease))
>                  pr_info("Unknown key code 0x%x\n", code);
> 

