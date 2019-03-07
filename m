From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
 machines
Date: Thu, 7 Mar 2019 20:30:16 +0800
Message-ID: <c84c9553-e31b-a175-59a3-aeb35afd0854@flygoat.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
 <20190307112041.GC13633@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307112041.GC13633@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


ÔÚ 2019/3/7 ÏÂÎç7:20, Greg KH Ð´µÀ:
> On Thu, Mar 07, 2019 at 04:08:20PM +0800, Jiaxun Yang wrote:
>> Some AMD based ThinkPads have a firmware bug that calling
>> "GBDC" will cause bluetooth on Intel wireless cards blocked.
>>
>> Probe these models by DMI match and disable bluetooth subdriver
>> if specified Intel wireless card exist.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 70 ++++++++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.

Thanks for remind.

Should I resend this patch in correct way?

> </formletter>

--

Jiaxun Yang
