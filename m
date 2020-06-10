From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v2 3/3] platform/x86: dell-wmi: add new dmi keys to
 bios_to_linux_keycode
Date: Wed, 10 Jun 2020 11:44:49 +0200
Message-ID: <20200610094449.xltvs2y6kp7driyh@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <cover.1591656154.git.y.linux@paritcher.com>
 <d585d2a0f01a6b9480352530b571dec2d1afd79f.1591656154.git.y.linux@paritcher.com>
 <8053252a-83ad-bcaa-2830-ccfbca1b4152@infradead.org>
 <20200608235508.wthtgilgmifwfgz2@pali>
 <ced5832cfe984c68b27a577cac0f02f1@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ced5832cfe984c68b27a577cac0f02f1@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: rdunlap@infradead.org, y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 09 June 2020 19:49:18 Mario.Limonciello@dell.com wrote:
> > 
> > Looking at the last two lines... and for me it looks like that 0x00FF
> > and 0xFFFF are just "placeholders" or special values for unknown /
> > custom / unsupported / reserved / special / ... codes.
> > 
> > It is really suspicious why first 38 values are defined, then there is
> > gap, then one value 255 and then huge gap to 65535.
> > 
> > Mario, this looks like some mapping table between internal Dell BIOS key
> > code and standard Linux key code. Are you able to get access to some
> > documentation which contains explanation of those Dell key numbers?
> > It could really help us to understand these gaps and what is correct
> > interpretation of these numbers.
> > 
> 
> The codes are actually 4 bytes in the table, but in practice nothing above the
> first two bytes is used.
> 
> Those two called out are special though, here are their meanings:
> 
> 0x00FF is user programmable function
> 0xFFFF is no function
> 
> For the purpose of memory consumption I think it's reasonable to ignore the
> upper 2 bytes and special case these two.

Thank you for information!

So 0x00FF is "user programmable" button. Do I understand it correctly
that Dell/BIOS does not explicitly provide meaning for these buttons,
they do not have fixed functionality and therefore user should configure
them as he want?

And what does mean "no function"? I do not know what should I imagine if
I receive key press marked as "no function".

> > E.g. I remember that pressing Fn+Q or Fn+W on some Dell Latitude
> > generates code 255, which could prove my thesis about "special codes"
> > (which are probably not found in e.g. Windows or Linux mapping tables).
> > 
> > > >  };
> > > >
> > > >  /*
> > > > @@ -503,10 +504,7 @@ static void handle_dmi_entry(const struct
> > dmi_header *dm, void *opaque)
> > > >  					&table->keymap[i];
> > > >
> > > >  		/* Uninitialized entries are 0 aka KEY_RESERVED. */
> > > > -		u16 keycode = (bios_entry->keycode <
> > > > -			       ARRAY_SIZE(bios_to_linux_keycode)) ?
> > > > -			bios_to_linux_keycode[bios_entry->keycode] :
> > > > -			KEY_RESERVED;
> > > > +		u16 keycode = bios_to_linux_keycode[bios_entry->keycode];
> > > >
> > > >  		/*
> > > >  		 * Log if we find an entry in the DMI table that we don't
> > > >
> > >
> > > Something like:
> > >
> > > 		u16 keycode;
> > >
> > > 		keycode = bios_entry->keycode == 0xffff ? KEY_UNKNOWN :
> > > 			(bios_entry->keycode <
> > > 			       ARRAY_SIZE(bios_to_linux_keycode)) ?
> > > 			bios_to_linux_keycode[bios_entry->keycode] :
> > > 			KEY_RESERVED;
> > >
> > >
> > >
> > > Also please fix this:
> > > (no To-header on input) <>
> > 
> > Hint: specifying git send-email with '--to' argument instead of '--cc'
> > should help.
> > 
> > >
> > > --
> > > ~Randy
> > >
