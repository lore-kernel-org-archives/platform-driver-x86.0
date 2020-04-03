From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: error fn f7 (asus)
Date: Thu, 2 Apr 2020 20:19:26 -0700
Message-ID: <3440f96b-291f-cd5e-7fc3-c3e9c0959f22@infradead.org>
References: <625e12e1-aee0-8b3c-8a4d-98e74739153c@ngs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <625e12e1-aee0-8b3c-8a4d-98e74739153c@ngs.ru>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "jack_solovey@ngs.ru" <jack_solovey@ngs.ru>, linux-kernel@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

[adding Cc's]

On 3/8/20 11:43 PM, jack_solovey@ngs.ru wrote:
> Hello, sorry this machine translation.
> 
> Laptop  Asus N56V
> Prior to kernel 5, the FN+F7 buttons turned off the laptop screen.
> Starting with kernel 5, these buttons turn on standby mode.
> I have to use core 4.18
> 
> Linux Asus-N56VB 4.18.0-25-generic #26~18.04.1-Ubuntu SMP Thu Jun 27 07:28:31 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> 
> Whether it is planned to return the legacy function to the fn+f7 buttons to disable the main monitor.

Hi,

Possibly caused by 78f3ac76d9e5219589718b9e4733bee21627b3f5
(platform/x86: asus-wmi: Tell the EC the OS will handle the display off hotkey).

-- 
~Randy
