From: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH] drivers:platform/x86:Use ARRAY_SIZE() for the size
 calculation of the array.
Date: Wed, 13 Sep 2017 14:21:12 +0530
Message-ID: <CAOMdWSKzUdcbCZvnENSrvjo=BbVz6O69_C8m4QRNq5cnOAJ9Zw@mail.gmail.com>
References: <1505289772-26045-1-git-send-email-allen.lkml@gmail.com> <5F7315E704FA0841B5DFCE90329B2BB4661DAC5A@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB4661DAC5A@BGSMSX102.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

>>  #define TELEM_IOSS_PG_EVTS           30
>>
>> -#define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
>> +#define TELEM_EVT_LEN(x) (ARRAY_SIZE(x))
> The outer parenthesis seems redundant to me.
>

Will send out a v2. Thanks.

       - Allen
