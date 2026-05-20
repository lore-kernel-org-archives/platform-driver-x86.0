Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFA140242E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303260; cv=fail; b=p/cTSG8AoRX7rLqk6i6JAhSgOPHlSO8FFQAbEJeV7lR9GqTFiCYfRv4JRc0dFJaVwLHyPP4P3s/Bus+srjl9qq8z5hK5pR2DIump98Ci3BRYso7vQH6mT4YRUoxiPRCJIq4GYZg+hHGnT46HYnhqFOABffDgiy3O3c+zNgY5lFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303260; c=relaxed/simple;
	bh=D9piAc+THtBS/PHKUWeG5GIrOHXACbvbN17AWh5mvtM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UAPaEusyu/luaCfUhtN7nue+H9W2tQVQCu/QrGbhKmwbF53js+3O3Ycz5wn9inzs1sYiPGiXci1qKNfwiwBO3a34PC7FpV5DbSNejAw936WzOQX4MExM33aRSXk039TZtOr1XX9m/9CL1q3Zi26o8xb+wZeIt3rjJcqNOhl37Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yz4+Ul/L; arc=fail smtp.client-ip=40.93.198.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yz4+Ul/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqkDSICn3FqKQWD26e5XRLLoEwyeWNWV6gtofDpdsvxkOK4e90ylHnEDfRvpbLZmeDRmnuegpy8LpW3cYGM8I8SI0sd3/hzpVGy1CQLne2E2aT/Q9jD77ixERsp1UtAzRFf7y8RnwM4U4nXgtXxcrWPsVMQFEpY/QUp2x4PFmxZqiuDG6+Ka/+H5uDDHWzFt89DjOKCGUY0OB4FHuJYwu36BBEAFzWORfMjT6FGZ3JVsa/m0/YGiIkLnL3xCjY/I0XszCY+BiVV/gCpGC6+L0VlrofRjtQ9f5y0B7vHuX+1gpunOC+7h2CIoH1EgGA0iNI1jpjN60qLv2wjicAxQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgYzzCAMZVyczvjzpl8eU7Fd66PgWnolNBtXUsoVYbo=;
 b=b2O3gt1EZj0Y+y0DCjEB1lNaAo0JBNy52efsVZWR99O/RtzMX55BA/dQIIarcydnJ+nnb57PXL5aG2SCNM36SrrxOvjW/f2hKCBZrkZ/hQVShDglvae3igNKWJ819W8nu8J4PmjgMBBeI1mQM2JKL/59HjYyLzjgfUl2e0QnXU84IANAvsfQ/MpzkQe5AgrKbKN6BeEubi7x3P2//2giCS+/vRKCCpVe4um+UfvgHmd0WHD67ISneRuHgOGCWSWSdUhf0jJj9FiKKcqp+Nr+hNz6Ji+MDjws9Aw8sYlDMr7eEOeQeDrBKBnu+nNCuBcy172Sudadam8dMcenZkHk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgYzzCAMZVyczvjzpl8eU7Fd66PgWnolNBtXUsoVYbo=;
 b=Yz4+Ul/LQv6oWDTVMfOfITI8PlS9SxJ2TuzPinGXrIxbDgFZIq8+q+SjI6hrokKFPizt/VJD+jjpcg2PFlIYLi7IL0Mn+bDVHvcGS8W3xrT04bvZhmBvwTh8zyba9dxzignmdS3Teaz5mnEwxyhVgBjNdlCgfjWRnodGQSeHC18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 20 May
 2026 18:54:12 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 18:54:12 +0000
Message-ID: <1073d83f-ab08-4bd4-971d-17d562a0f8eb@amd.com>
Date: Thu, 21 May 2026 00:24:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] platform/x86/amd/pmf: Introduce AMD PMF testing
 tool for driver metrics and features
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
 <20260507144524.664001-7-Shyam-sundar.S-k@amd.com>
 <6a14c3a2-1d61-7431-eab5-6bac57580c36@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6a14c3a2-1d61-7431-eab5-6bac57580c36@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 740c5b4a-a220-4770-823c-08deb6a12e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|22082099003|56012099003|5023799004|6133799003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	QSLfR0xdOWIfEWFvG+G9VtsjrAYiDMVWGIxLWj6dXvhidIUocGjbN0Azt80AgGz5qcbkvNAkkGavXcLhX1nomOPTE7hpZvDDTUqaLQkQOCxpWi9L//K9hjXos1bYW1FlyPce/10kvoMZJaJpCUjIs8YUMERIP1Z23DwT8GPWSjJPFKwxku/dDL7ZHIOSu59dloNdgfP5k8f7AjZQt1q87b0OpKr85Sa5nJDAM3BUc+IxX7fRhjQpgNUuGkTztNQThFPd1Ps1ymWSTfhH/Y+EXhf0o2h+0SVZDPqfxctT3sHvlE5+tAs3vlP5oeg3m68Ygo5ZTS5ROah24OvDpDxGkWGyVMeUsgy1fuOZlLeRfqf98SzxYNWD93bbaPWProO4r6VCxV4zVYjgKlpC0EutmeqzmfWGBTJ60pHbU4O94g6qaQzV40u+sucnrNmJ1I8WAjfbhHChXYQ0lWwgA89VgspNaiQ41vjxoXHn5YRg+h+oubMN1mDqtfPGd9p7DwV7agvHKaZ+FO+P0Ny3muWoDzwGqlwNWSTtJ/Y97K6oGBJqqtyTeTlLI8lNKQVBc2jHttHzuhdSIndrawYvasFOGoIcxR9dRZRYNUrGNzzGB3e0HR3j5pT2czVlP2dLQza03EqPQmjcIHihK8/9jQZOWXVQoArj4Xcj3OAVlZ2+3G0f+lZ7XI29WXPP+5bWI621
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(22082099003)(56012099003)(5023799004)(6133799003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FVT3k2a0hyWHpLampBWUhUcDZZN0Q0SHZjdVNmS2c2R3VOWmhpQmE4Uy9E?=
 =?utf-8?B?K2pxWHlvTjNQd2ZFWVZKa0d1cFk0d3NrdFpOczlQV0lPRlRqa2R2OXpnNFhI?=
 =?utf-8?B?T21YUUN1ME1zU1kySXBCU29UbWtSTHZ2bUZ0RDMrdkE1MWJrWEhhMWZuV1VR?=
 =?utf-8?B?VWx0Sk5yYW5YK1ZsYnJnYmx1UUliR2hQV1dtZm1Hc0U4M2VtcVora1VvaGFv?=
 =?utf-8?B?c1FqMjVGTTJlK2h0YU1MVmpFWVlXbk1XU1NpcEp0bkxJNG5URW9yN0ZicVA0?=
 =?utf-8?B?UGYwbHZ3TkdiemhMM1RkQ3dJOGJSV01GU0JlSlNTamJqdVhYR2hRL1A3ZHhi?=
 =?utf-8?B?OEovSkpBZ0ZPbzZxSHZVRWV3UVc0eDl4dUU0MHd6SnRXUXpWYVJyNzJ1UjhV?=
 =?utf-8?B?bDFPY0VSem55M203K2t4MEhBZS8xWDRFVGorN0t4OHhIdnlxZkNMN25KNEg3?=
 =?utf-8?B?cWV1ZFF5QzQrK2N6TlNBa1NQYzFhZU5JVW85KzBOUGg3cXc1QnRBbXVvaXBx?=
 =?utf-8?B?QWdOcGVtaXhqRm1HZFhQTGxuUE1JcnVaR3ZYdFN6Z0RXejVESXpDM2VEWkdl?=
 =?utf-8?B?V3o5SjdiR1NRODVsVFU1ZFVKempXZEhHckZLVzZrdkVTVm51cW5hUG1KWFIw?=
 =?utf-8?B?TFQ4Kzh1WDBFbC9hMSt1WGl3OS9lSWlPdnFscjZpcHhFbXp0cjF2SnBkT1Bu?=
 =?utf-8?B?cEZWbDRsZENjNWx5Rkh0SVZxWVFTaytWZ0t2czdTWDhYMDJNV3VuZmhkSTc5?=
 =?utf-8?B?UFI3SmI4Qm1EdEdEMmdSOTJ6OTRxNWcyU0JTUmhCbldWQ1g0TlVhTlBVRm1h?=
 =?utf-8?B?ckEyMDFFb3NFMXJFbkNPMEt2NXRGQWpFK0RWN293SFpxNzhzdHZjb1M3cTVO?=
 =?utf-8?B?Uk01bGxXUWVJcUF3Z3BKSEp5ZWttOVYrUGxsZndqbUNwRWFsQ0hteWRXVkp6?=
 =?utf-8?B?QVBvZUxoUkYvWGUyb3dnTXBrNTdyNUZZTWUya3R0OXYrYW8vM3EwU2g4dkZV?=
 =?utf-8?B?UjI0d1NnMXlDS0NqdlF6V1VmdlBsOEdSRXNNZGY4aXJNRzBlY3dlRWYvSEkw?=
 =?utf-8?B?OVFjd2RXclp5L2FlS2VlT0U3Z2NTR0tld0NoUXYyY1Vlc3FzbmFoemZQRXMr?=
 =?utf-8?B?QWdoSDR0c0E1d1pmZGY3UFJLY2Z1cFJtNENoeEx5a0VxRVJqMkxqOFEzUVls?=
 =?utf-8?B?ZjNvaVE4TG4wMy9Jeml5UkhWTis4RFVIOTBiYU5NYm5QdTd0aFBmak4vUUNP?=
 =?utf-8?B?SDVKb0M0blp4MW5KMTZpMFFvakVGUWhtaTNad21mYnVaOEV0SW9uUzAzOGlm?=
 =?utf-8?B?ZEhPUER6ZW1rbERYRGI3c1FQS2VDNEluRURhWGR2MUVtMzlxVjJFMERtWE0v?=
 =?utf-8?B?K0RPTnVIV1BqcG52YzE1ZmxvTWNBYWRLcVdWeVlYNzg5eGJOVDFuWTdHbHla?=
 =?utf-8?B?aEtEaWsyS3NGUXd2SWNoaWwvYnRYQmRvazBwaVFOOStZZWZGQ3RjZFBWZDlJ?=
 =?utf-8?B?YXpYOXBiWFZGTnlqNHg1cXNSYXZRdGpxcnRxRzRyUzJRYUd1UjNEN3F1aTJ1?=
 =?utf-8?B?cFFSTEV1eE90UUN3SDJKM09qUFdwLzRIYk4vbk1MWjJ4emxLYjlHVzdmanhh?=
 =?utf-8?B?RWFpeUJCUlQwRU9NQnpqUUVqZ3k4aVBtNVR5ckZkTzRSbXBQYm5yWGEwU1k0?=
 =?utf-8?B?d093b0JtZ2xGcEk4MkpWSkNiaDdHWE9rT2djQmM1QWhqcWZNd05CbVZKQ3pB?=
 =?utf-8?B?aGtVakR5ZjdodzdUaE1RRTN2cHlTSFRqR080eDFaZjlsU0YvYXVveWxDYnJJ?=
 =?utf-8?B?MjBvLzNBekVjemx0QUFTVk5iaFgzeEJ6ZUxJOThzZVhxbklZN200Q011TW81?=
 =?utf-8?B?SEp2VkpEQWtLTlliUUJiYXRJL2krSmRmS3JvSjM1MjF2YUs0RzZob293KzZm?=
 =?utf-8?B?K0dZTzY4TzVvL25NN2U0UjMwRjcwOVQwVktoa3BQcytyeHVxYTU0QmxDZTVh?=
 =?utf-8?B?c1p2UVFwTXJORG96Y3lQMmpSMUZsRnZlckNJN05uNDBFbHZVdjdlQzhNUXph?=
 =?utf-8?B?ZUwrU3lqYTBLRG5UMXRwQW9pVWVUQ0RmKzR2RmwramVWNGdKbUtVZnNmTkdE?=
 =?utf-8?B?eGk4Nk8wbWlFbWsyRndzWTZadE1XTVpyR3kzUEZtUDlXTWFyeS9IdkJaMkV2?=
 =?utf-8?B?TXZGU0Rhd3grK0xpVjh0cXRoVkNJaWlQZmhCQW5XaFRZUEp4SWdJZW9Jc3o1?=
 =?utf-8?B?bjFSWXR3L2lEaDI0Ny9WMnU1UXVhZVJQMnNiZW85SXpuY1RNdGVuZi9haU5M?=
 =?utf-8?B?MkFSdlh0YUxNaEF2dW1SRDU4L1FkUFJsWnZJR3loQW9TTjNFM1dYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740c5b4a-a220-4770-823c-08deb6a12e77
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:54:12.0761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtzmaOAhQTEgGCTmC/rjPruxr5MGIHWa8Dq2o2hvD3yT3YVs/Z2azmJpvADMup/Yrpf6bP9huvomsCxLui9XfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7199



On 5/19/2026 16:10, Ilpo Järvinen wrote:
> On Thu, 7 May 2026, Shyam Sundar S K wrote:
> 
>> This tool leverages amd-pmf ioctls exposed via the util layer, allowing
>> validation of its newly integrated util layer and /dev/amdpmf_interface.
>> It includes a user-space test application, test_amd_pmf, designed to
>> interact with the PMF driver and retrieve relevant metrics for the
>> testing and analysis.
>>
>> It provides definitions for test metrics, feature IDs, and device states,
>> and includes tests for various AMD PMF metrics such as power source, skin
>> temperature, battery state, and custom BIOS inputs/outputs. It also
>> enables the testing of PMF metrics data and feature support reporting.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  tools/platform/x86/amd/Makefile   |  60 +++++++++++++
>>  tools/platform/x86/amd/test-pmf.c | 142 ++++++++++++++++++++++++++++++
>>  2 files changed, 202 insertions(+)
>>  create mode 100644 tools/platform/x86/amd/Makefile
>>  create mode 100644 tools/platform/x86/amd/test-pmf.c
>>
>> diff --git a/tools/platform/x86/amd/Makefile b/tools/platform/x86/amd/Makefile
>> new file mode 100644
>> index 000000000000..5d820df5871f
>> --- /dev/null
>> +++ b/tools/platform/x86/amd/Makefile
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +ifeq ($(srctree),)
>> +srctree := $(patsubst %/,%,$(dir $(CURDIR)))
>> +srctree := $(patsubst %/,%,$(dir $(srctree)))
>> +srctree := $(patsubst %/,%,$(dir $(srctree)))
>> +srctree := $(patsubst %/,%,$(dir $(srctree)))
>> +endif
>> +
>> +# Include common tools build infrastructure
>> +include $(srctree)/tools/scripts/Makefile.include
>> +
>> +CC		= $(CROSS_COMPILE)gcc
>> +BUILD_OUTPUT	:= $(CURDIR)
>> +PREFIX		?= /usr
>> +DESTDIR		?=
>> +
>> +ifeq ("$(origin O)", "command line")
>> +	BUILD_OUTPUT := $(O)
>> +endif
>> +
>> +# Include paths: tools/include has linux/kernel.h with ARRAY_SIZE
>> +INCLUDES	= -I$(srctree)/tools/include
>> +INCLUDES	+= -I$(srctree)/tools/include/uapi
>> +INCLUDES	+= -I$(srctree)/include/uapi
>> +INCLUDES	+= -I$(srctree)/include
>> +
>> +override CFLAGS += -O2 -Wall -Wextra -D_GNU_SOURCE $(INCLUDES)
>> +override CFLAGS += -D_FILE_OFFSET_BITS=64
>> +override CFLAGS += -D__EXPORTED_HEADERS__
>> +
>> +TARGETS		= test_amd_pmf
>> +
>> +all: $(TARGETS)
>> +
>> +test_amd_pmf: test-pmf.c
>> +	$(QUIET_CC)$(CC) $(CFLAGS) $< -o $(BUILD_OUTPUT)/$@ $(LDFLAGS)
>> +
>> +.PHONY: clean
>> +clean:
>> +	$(call QUIET_CLEAN, test_amd_pmf)$(RM) $(BUILD_OUTPUT)/test_amd_pmf
>> +
>> +.PHONY: install
>> +install: $(TARGETS)
>> +	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
>> +	$(INSTALL) $(BUILD_OUTPUT)/test_amd_pmf $(DESTDIR)$(PREFIX)/bin/test_amd_pmf
>> +
>> +.PHONY: help
>> +help:
>> +	@echo "AMD Platform Tools Makefile"
>> +	@echo ""
>> +	@echo "Targets:"
>> +	@echo "  all           - Build all tools (default)"
>> +	@echo "  test_amd_pmf  - Build the PMF test tool"
>> +	@echo "  clean         - Remove built files"
>> +	@echo "  install       - Install tools to $(PREFIX)/bin"
>> +	@echo ""
>> +	@echo "Variables:"
>> +	@echo "  O=<dir>        - Build output directory"
>> +	@echo "  PREFIX         - Installation prefix (default: /usr)"
>> +	@echo "  DESTDIR        - Destination directory for install"
>> diff --git a/tools/platform/x86/amd/test-pmf.c b/tools/platform/x86/amd/test-pmf.c
>> new file mode 100644
>> index 000000000000..a57f5c0e2565
>> --- /dev/null
>> +++ b/tools/platform/x86/amd/test-pmf.c
>> @@ -0,0 +1,142 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD Platform Management Framework Test Tool
>> + *
>> + * Copyright (c) 2026, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + *          Sanket Goswami <Sanket.Goswami@amd.com>
>> + */
>> +
>> +#include <errno.h>
>> +#include <fcntl.h>
>> +#include <inttypes.h>
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <sys/ioctl.h>
>> +#include <unistd.h>
> 
> Add an empty like here.
> 
>> +#include <linux/amd-pmf.h>
>> +#include <linux/kernel.h>
>> +
>> +#define DEVICE_NODE	"/dev/amdpmf_interface"
>> +
>> +/* Feature flag names */
>> +static const char * const feature_names[] = {
>> +	"Auto Mode",
>> +	"Static Power Slider",
>> +	"Policy Builder (Smart PC)",
>> +	"Dynamic Power Slider AC",
>> +	"Dynamic Power Slider DC",
>> +};
>> +
>> +/* Print feature flags */
>> +static void pmf_print_features(uint32_t flags)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < (int)ARRAY_SIZE(feature_names); i++) {
> 
> Why can't this be done without cast?
> 
>> +		if (flags & (1U << i))
>> +			printf("  [x] %s\n", feature_names[i]);
>> +		else
>> +			printf("  [ ] %s\n", feature_names[i]);
> 
> I suggest using elvis operator for " "/"x" variation.
> 
>> +	}
>> +}
>> +
>> +/* Print BIOS parameters */
>> +static void pmf_print_bios_params(const char *type, const __u32 *params)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < AMD_PMF_BIOS_PARAMS_MAX; i++)
>> +		printf("  Custom BIOS %s%d: %u\n", type, i + 1, params[i]);
>> +}
>> +
>> +/* Open the PMF device */
>> +static int pmf_open_device(void)
>> +{
>> +	int fd;
>> +
>> +	fd = open(DEVICE_NODE, O_RDONLY);
>> +	if (fd < 0)
>> +		fprintf(stderr, "Error: Cannot open %s: %s\n", DEVICE_NODE, strerror(errno));
>> +
>> +	return fd;
>> +}
>> +
>> +/* Query PMF info using the single IOCTL */
>> +static int pmf_get_info(int fd, struct amd_pmf_info *info)
>> +{
>> +	int ret;
>> +
>> +	/* Zero-initialize and set size for versioning */
>> +	memset(info, 0, sizeof(*info));
>> +	info->size = sizeof(*info);
>> +
>> +	ret = ioctl(fd, IOCTL_AMD_PMF_POPULATE_DATA, info);
>> +	if (ret < 0) {
>> +		fprintf(stderr, "Error: IOCTL_AMD_PMF_POPULATE_DATA failed: %s\n", strerror(errno));
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void pmf_print_info(const struct amd_pmf_info *info)
>> +{
>> +	printf("=================================================\n");
>> +	printf("      AMD PMF Metrics info and Feature Status\n");
>> +	printf("=================================================\n\n");
> 
> I suppose you could make this banner a const char * and call printf() only 
> once for it (it can be nicely formatted to multiple lines by splitting 
> "" per line).

Thank you for the feedback. Ack to all the comments in this series.

Thanks,
Shyam

> 
>> +
>> +	/* Feature status */
>> +	printf("Feature Status:\n");
>> +	pmf_print_features(info->features_supported);
>> +
>> +	/* Device states */
>> +	printf("\nDevice States:\n");
>> +	printf("  Platform Type:     %s\n", amd_pmf_get_pt(info->platform_type));
>> +	printf("  Laptop Placement:  %s\n", amd_pmf_get_lp(info->laptop_placement));
>> +	printf("  Lid State:         %s\n", info->lid_state ? "Closed" : "Open");
>> +	printf("  User Presence:     %s\n", info->user_presence ? "Present" : "Away");
>> +	printf("  Slider Position:   %s\n", amd_pmf_get_sp(info->slider_position));
>> +
>> +	/* Thermal and power metrics */
>> +	printf("\nThermal/Power Metrics:\n");
>> +	printf("  Skin Temperature:  %d\n", info->skin_temp / 100);
>> +	printf("  GFX Busy:          %u\n", info->gfx_busy);
>> +	printf("  Ambient Light:     %d\n", info->ambient_light);
>> +	printf("  Avg C0 Residency:  %u\n", info->avg_c0_residency);
>> +	printf("  Max C0 Residency:  %u\n", info->max_c0_residency);
>> +	printf("  Socket Power:      %u\n", info->socket_power);
>> +
>> +	/* BIOS parameters */
>> +	printf("\nCustom BIOS Input Parameters:\n");
>> +	pmf_print_bios_params("Input", info->bios_input);
>> +	printf("\nCustom BIOS Output Parameters:\n");
>> +	pmf_print_bios_params("Output", info->bios_output);
>> +
>> +	printf("\n=================================================\n");
>> +}
>> +
>> +int main(void)
>> +{
>> +	struct amd_pmf_info info;
>> +	int fd, ret;
>> +
>> +	fd = pmf_open_device();
>> +	if (fd < 0)
>> +		return -1;
>> +
>> +	/* Query all info with single IOCTL */
>> +	ret = pmf_get_info(fd, &info);
>> +	close(fd);
>> +
>> +	if (ret < 0)
>> +		return -1;
>> +
>> +	pmf_print_info(&info);
>> +
>> +	return 0;
>> +}
>>
> 

