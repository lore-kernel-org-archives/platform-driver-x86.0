From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Mon, 18 Jan 2016 10:19:28 -0800
Message-ID: <CALCETrV_eaNwd82JNAHfePqHOTZG6ZkZ4BkRXuuO9OQBTXZVsQ@mail.gmail.com>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
 <20160118164425.1e94185b@endymion.delvare> <CALCETrVqb4awUCvm4KYRqi2mgCW2O00=-2-T=NSngrtzEeH93g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CALCETrVqb4awUCvm4KYRqi2mgCW2O00=-2-T=NSngrtzEeH93g@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Andy Lutomirski <luto@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 18, 2016 at 10:09 AM, Andy Lutomirski <luto@amacapital.net> wrote:
> On Mon, Jan 18, 2016 at 7:44 AM, Jean Delvare <jdelvare@suse.de> wrote:
>>> +
>>> +     if (dm->type != 0xb2 || dm->length <= 6)
>>> +             return;
>>> +
>>> +     table = container_of(dm, struct dell_bios_hotkey_table, header);
>>> +
>>> +     hotkey_num = (table->header.length - 4) /
>>> +                             sizeof(struct dell_bios_keymap_entry);
>>
>> The problem is not introduced by your patch, but the length check is
>> inconsistent. sizeof(struct dell_bios_keymap_entry) is 4.
>
> Yes, but sizeof(struct dell_bios_keymap_table) is 6.

No it's not.  It's 4.  And my math below was all messed up, too.

You were exactly right, and I'll fix it.

--Andy
