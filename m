From: Kristian Klausen <kristian@klausen.dk>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support laptops where the
 first battery is named BATT
Date: Tue, 25 Feb 2020 10:51:50 +0100
Message-ID: <af54a82e-0b9f-1e88-8741-bd4a3658d8e7@klausen.dk>
References: <20200223181832.17131-1-kristian@klausen.dk>
 <20200224011017.C5207208C4@mail.kernel.org>
 <e700ebdc-3dce-c151-3ea5-f7ab1e4cb07f@klausen.dk>
 <CAHp75VcAZZ-d1BQON0ciLoCGt5=1qh4s1jLGhDdApicT+7BEGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcAZZ-d1BQON0ciLoCGt5=1qh4s1jLGhDdApicT+7BEGg@mail.gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 25.02.2020 10.30, Andy Shevchenko wrote:
> On Mon, Feb 24, 2020 at 3:15 AM Kristian Klausen <kristian@klausen.dk> wrote:
>> On 24.02.2020 02.10, Sasha Levin wrote:
>>> NOTE: The patch will not be queued to stable trees until it is upstream.
>>>
>>> How should we proceed with this patch?
>> The patch should only be applied to the v5.4 and v5.5 trees.
> I'm not sure I got this right. Do we have already this change in upstream?
> I don't see it there. So, why there is no mention of the v5.6 and
> current upstream in above list?

Sorry about that, my response does not make any sense.
The change isn't upstream yet, and should be applied upstream first and 
the 5.4 and 5.6 tree tree if possible.
Was I wrong CC'ing stable@vger.kernel.org? (suggested by git send-email 
due to "Cc: stable@vger.kernel.org")
