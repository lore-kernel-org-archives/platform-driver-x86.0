From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v3] dmi: Make dmi_walk and dmi_walk_early return real
 error codes
Date: Sat, 30 Jan 2016 10:13:09 -0800
Message-ID: <CALCETrXbvv2nQ6XJSocbEukoFQbWd437jaRQ4WjGigxjrMNtGw@mail.gmail.com>
References: <0e75e48f9944d14ed914342a4780c199095ad747.1453247603.git.luto@kernel.org>
 <20160122101222.3a29841d@endymion.delvare> <20160130180517.GB1862@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160130180517.GB1862@malice.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jean Delvare <jdelvare@suse.de>, Andy Lutomirski <luto@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jan 30, 2016 at 10:05 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Fri, Jan 22, 2016 at 10:12:22AM +0100, Jean Delvare wrote:
>> Hi Andy,
>>
>> Sorry for the delay.
>>
>> On Tue, 19 Jan 2016 15:54:46 -0800, Andy Lutomirski wrote:
>> > Currently they return -1 on error, which will confuse callers if
>> > they try to interpret it as a normal negative error code.
>> >
>> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> > ---
>> >
>> > Changes from v3:
>>
>> You mean from v2...
>>
>> >  - Split out from the series it was in.
>> >  - Use -ENXIO for "there's no DMI".
>> >  - Also fix docs and !DMI case.
>> >
>> > Changes from v2:
>>
>> ... and from v1.
>>
>> >  - Total rewrite.
>> >
>> > drivers/firmware/dmi_scan.c | 9 +++++----
>> >  include/linux/dmi.h         | 2 +-
>> >  2 files changed, 6 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
>> > index 0e08e665f715..0418fed261bb 100644
>> > --- a/drivers/firmware/dmi_scan.c
>> > +++ b/drivers/firmware/dmi_scan.c
>> > @@ -144,7 +144,7 @@ static int __init dmi_walk_early(void (*decode)(const struct dmi_header *,
>> >
>> >     buf = dmi_early_remap(dmi_base, orig_dmi_len);
>> >     if (buf == NULL)
>> > -           return -1;
>> > +           return -ENOMEM;
>> >
>> >     dmi_decode_table(buf, decode, NULL);
>> >
>> > @@ -970,7 +970,8 @@ EXPORT_SYMBOL(dmi_get_date);
>> >   * @decode: Callback function
>> >   * @private_data: Private data to be passed to the callback function
>> >   *
>> > - * Returns -1 when the DMI table can't be reached, 0 on success.
>> > + * Returns 0 on success, -ENXIO if DMI is not selected or not present,
>> > + * or a different negative error code if DMI walking fails.
>>
>> Returning an error from DMI walking isn't yet implemented so this is
>> confusing. If it ever is, most likely it will be implemented as a
>> separate function. Or were you only referring to the -ENOMEM case below?
>>
>> >   */
>> >  int dmi_walk(void (*decode)(const struct dmi_header *, void *),
>> >          void *private_data)
>> > @@ -978,11 +979,11 @@ int dmi_walk(void (*decode)(const struct dmi_header *, void *),
>> >     u8 *buf;
>> >
>> >     if (!dmi_available)
>> > -           return -1;
>> > +           return -ENOENT;
>>
>> Should be -ENXIO as documented above? Not that I really understand how
>> "No such device or address" is going to be a helpful error message for
>> the user. What's wrong with -ENOTSUP I suggested earlier?
>>
>
> Andy,
>
> If I understand this correctly, this is the first of 5 patches, and this one has
> some unanswered questions from Jean here. If this patch gets respun, the
> following are also impacted:
>
> dell-wmi: Stop storing pointers to DMI tables
> dell-wmi, dell-laptop: select DMI
> dell-wmi: Clean up hotkey table size check
> dell-wmi: Support new hotkeys on the XPS 13 9350 (Skylake)
>
> Is that correct?

Not really.  It's just the three patches here:

http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/8503

This patch (the dmi_walk error code one) is no longer really related.
Due to Jean's earlier comment about what happens if DMI isn't enabled
at all, I no longer propagate the error code from dmi_walk in
dell-wmi, so the error code won't have any effect.  (Instead I just
warn and let the driver load in legacy mode, which matches the current
behavior.)

I think the way to go is for the v3 "dell-wmi: DMI misuse fixes"
series to go in through your tree, and I'll hash out the error code
thing separately with Jean.

Does that seem sensible?

--Andy
