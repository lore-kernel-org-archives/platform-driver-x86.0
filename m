From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 3/3] platform//x86/pcengines-apuv2: update gpio button
 definition
Date: Wed, 24 Jul 2019 01:00:19 +0200
Message-ID: <ab15f31b-e585-15c2-877a-5fcc13e85e14@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-4-fe@dev.tdt.de>
 <cca95ba1-6ac0-a2eb-9ae6-914a8783c1ad@metux.net>
 <CALPCC5wH_uAGYaHeM_d_yxxUZEd3f-MfhT7jdZSt9ythd08S9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALPCC5wH_uAGYaHeM_d_yxxUZEd3f-MfhT7jdZSt9ythd08S9w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <eckert.florian@googlemail.com>
Cc: Florian Eckert <fe@dev.tdt.de>, info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 23.07.19 09:06, Florian Eckert wrote:
>> I'd like to ack only the keycode change, but not the deprecated .gpio
>> field. I'll post a separate patch for the keycode change only.
> 
> I am fine if we only change the keycode.
> Do I have to send a v2 patch set?
> 

already sent one.

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
