From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH] platform/x86: alienware-wmi: fix kfree on potentially
 uninitialized pointer
Date: Wed, 3 Apr 2019 23:27:52 +0100
Message-ID: <f649f63e-9dc5-8c8d-39ab-cf624f75c550@canonical.com>
References: <20190330001712.8923-1-colin.king@canonical.com>
 <20190403220200.GC39081@wrath>
 <424c2bba-1e17-3131-c15b-44462c57e22d@canonical.com>
 <20190403222626.GA11745@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190403222626.GA11745@wrath>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 03/04/2019 23:26, Darren Hart wrote:
> On Wed, Apr 03, 2019 at 11:05:12PM +0100, Colin Ian King wrote:
>> On 03/04/2019 23:02, Darren Hart wrote:
>>> On Sat, Mar 30, 2019 at 12:17:12AM +0000, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Currently the kfree of output.pointer can be potentially freeing
>>>> an uninitalized pointer in the case where out_data is NULL. Fix this
>>>> by reworking the case where out_data is not-null to perform the
>>>> ACPI status check and also the kfree of outpoint.pointer in one block
>>>> and hence ensuring the pointer is only freed when it has been used.
>>>>
>>>> Also replace the if (ptr != NULL) idiom with just if (ptr).
>>>>
>>>> Fixes: ff0e9f26288d ("platform/x86: alienware-wmi: Correct a memory leak")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>
>>> Thanks for the catch Colin, queued for testing.
>>>
>>> Did you trigger this error or detect it via review or static analysis?
>>>
>> Static analysis, I'm now running a licensed version of Coverity on one
>> of our servers.
> 
> We typically include the tool used to identify such bugs, and I see several such
> tags for Coverity in the logs. Was there a reason not to include that tag? If
> just an oversight, can you provide that tag and I'll amend the commit.
> 
I didn't have an external coverity CID# number so I omitted it this time.
