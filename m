From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v10 12/15] platform/x86: dell-smbios: Add filtering support
Date: Fri, 5 Jan 2018 16:44:13 +0200
Message-ID: <CAHp75VckJ6Ea445qjGocTCEiOhZ-wKZHV5fP4-_Vt=HvDKLLgw@mail.gmail.com>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <2dfbb122aa11fa9ff73cbfc6a403b82d1bb2e7c8.1508434514.git.mario.limonciello@dell.com>
 <20180105111313.23c6vjs2x3fhtvi4@pali> <8e1b17a4da0d404eb36920297e408d9f@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8e1b17a4da0d404eb36920297e408d9f@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 5, 2018 at 4:32 PM,  <Mario.Limonciello@dell.com> wrote:

>> I know that this patch is already applied and merged, but I spotted this
>> problem:
>>
>> On Thursday 19 October 2017 12:50:15 Mario Limonciello wrote:
>> > +/* calls that are explicitly blacklisted */
>> > +static struct smbios_call call_blacklist[] = {
>> > +   {0x0000, 01, 07}, /* manufacturing use */
>> > +   {0x0000, 06, 05}, /* manufacturing use */
>> > +   {0x0000, 11, 03}, /* write once */
>> > +   {0x0000, 11, 07}, /* write once */
>>
>> Numbers prefixed by zero means that they are in octal notation, right?
> Is that how the kernel interprets an integer prefix by zero?

No, compiler.

> I prefixed by zero for readability, they're supposed to be decimal.

...which make a confusion. Luckily you don't have 8 and 9 there,
otherwise I even don't know if it would be a compilation warning.

>> This can lead to misunderstanding, confusion or problems in future...
>>
>> Can we have all numbers either in hexadecimal or decimal notation?
>
> Could you elaborate more why this is problematic the way it is?

> Are you meaning you would rather see this?
>         {0x0000, 1, 7}, /* manufacturing use */
>         {0x0000, 6, 5}, /* manufacturing use */
>         {0x0000, 11, 3}, /* write once */
>         {0x0000, 11, 7}, /* write once */

I think something like that. You might use white space for indentation.

>
> That seems less readable to me but should interpret the same way.
>
> Perhaps it would be better if you submit a patch with what is clearer to
> you.



-- 
With Best Regards,
Andy Shevchenko
