From: Kristian Klausen <kristian@klausen.dk>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support laptops where the
 first battery is named BATT
Date: Tue, 3 Mar 2020 19:03:36 +0100
Message-ID: <4eeb33dc-0838-2feb-74d4-522fe470256b@klausen.dk>
References: <20200223181832.17131-1-kristian@klausen.dk>
 <20200224011017.C5207208C4@mail.kernel.org>
 <e700ebdc-3dce-c151-3ea5-f7ab1e4cb07f@klausen.dk>
 <CAHp75VcAZZ-d1BQON0ciLoCGt5=1qh4s1jLGhDdApicT+7BEGg@mail.gmail.com>
 <af54a82e-0b9f-1e88-8741-bd4a3658d8e7@klausen.dk>
 <CAHp75VfGkn_oGCNyP=RWo9fHvh8YzEy6e7cDCczJefsq2HMRFw@mail.gmail.com>
 <CAHp75VeG0CgORmpsH8q72MAXhgQs29QAXs1w4B4FxReQ01S7dA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeG0CgORmpsH8q72MAXhgQs29QAXs1w4B4FxReQ01S7dA@mail.gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


On 03.03.2020 15.46, Andy Shevchenko wrote:
> On Tue, Feb 25, 2020 at 11:55 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Feb 25, 2020 at 11:51 AM Kristian Klausen <kristian@klausen.dk> wrote:
> ...
>
>>> Sorry about that, my response does not make any sense.
>>> The change isn't upstream yet, and should be applied upstream first and
>>> the 5.4 and 5.6 tree tree if possible.
>> The usual pattern is to add Fixes tag and Cc: stable@.
>>
>>> Was I wrong CC'ing stable@vger.kernel.org? (suggested by git send-email
>>> due to "Cc: stable@vger.kernel.org")
> Kristian, to be clear, I'm waiting for v3 with appropriate tag and Cc
> list applied.

Oh, I forgot. I just sent a V3 with "Fixes".
