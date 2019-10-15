From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] platform/x86: huawei-wmi: Fix misuse of strcmp() function
Date: Tue, 15 Oct 2019 14:26:47 -0500
Message-ID: <d5f4164f-7cee-3fdb-49ce-4e1d1d70572a@embeddedor.com>
References: <20191015182549.GA13772@embeddedor>
 <336c7fa6eebdbada759c9ad30a0a6b85af6f6c58.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <336c7fa6eebdbada759c9ad30a0a6b85af6f6c58.camel@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: ayman.bagabas@gmail.com, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Ayman,

On 10/15/19 14:08, ayman.bagabas@gmail.com wrote:

>>  	/* Huawei laptops come with one battery only */
>> -	if (strcmp(battery->desc->name, "BAT") != 1)
> 
> Note we don't have a battery number in BATx, strcmp would return 1 if
> battery->desc->name is "BAT0" or any one digit. This is a desired
> behavior where some Huawei laptops identify the first battery as "BAT1"
> and this would match if name is greater than "BAT" by one digit.
> 

Great to know this is not a bug. I don't think there is any
other instance in the whole codebase like this one: strcmp(...) != 1
So, that's an odd thing to see...  Maybe you can consider adding
the whole description above as a code comment? :)

> Maybe strcmp(battery->desc->name, "BAT") < 0 is a better way to go.
> 

Yeah; this is bit more specific.

Thanks!
--
Gustavo
