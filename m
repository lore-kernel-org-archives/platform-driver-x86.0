From: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 4/8] eeepc-laptop: pull out eeepc_destroy_rfkill
Date: Tue, 28 Oct 2014 09:16:57 +0100
Message-ID: <CAH6sp9N3_XZPrZvw25XrkyvCm5HccMmkgFiPrJgCnBqVhjLYjw@mail.gmail.com>
References: <1414005163-3461-1-git-send-email-fransklaver@gmail.com>
	<1414005163-3461-5-git-send-email-fransklaver@gmail.com>
	<20141028051935.GF60814@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141028051935.GF60814@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 28, 2014 at 6:19 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Oct 22, 2014 at 09:12:39PM +0200, Frans Klaver wrote:
>> In eeepc_rfkill_exit, we implement the same code four times. Pull out a
>> function that cleans up an rfkill object to get rid of the duplication.
>>
>> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
>> ---
>>  drivers/platform/x86/eeepc-laptop.c | 34 ++++++++++++++--------------------
>>  1 file changed, 14 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
>> index e92ea41..73e8d39 100644
>> --- a/drivers/platform/x86/eeepc-laptop.c
>> +++ b/drivers/platform/x86/eeepc-laptop.c
>> @@ -823,35 +823,29 @@ static char EEEPC_RFKILL_NODE_1[] = "\\_SB.PCI0.P0P5";
>>  static char EEEPC_RFKILL_NODE_2[] = "\\_SB.PCI0.P0P6";
>>  static char EEEPC_RFKILL_NODE_3[] = "\\_SB.PCI0.P0P7";
>>
>> +static inline void eeepc_destroy_rfkill(struct rfkill **rfkill)
>> +{
>> +     if (!*rfkill)
>> +             return;
>> +     rfkill_unregister(*rfkill);
>> +     rfkill_destroy(*rfkill);
>> +     *rfkill = NULL;
>> +}
>
> In this case the savings is 6 lines at the cost of some legibility as double
> pointers are arguably harder to read, and definitely easier to screw up ;-)
>
> I appreciate the goal, but I'm not convinced it is worth it.

Fair enough. If anything the following would be slightly less complicated:

#define eeepc_destroy_rfkill(rfkill) \
do { \
        if (rfkill) { \
                 rfkill_unregister(rfkill); \
                 rfkill_destroy(rfkill); \
                 rkfill = NULL; \
        } \
} while (0);

I don't think any new eeepc's are being produced, so this code is
unlikely to change anyway. Let's leave it as is.

Thanks,
Frans
