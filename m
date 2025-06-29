Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0731ACEA6
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751213987; cv=none; b=kC9D32gPiT24ku/YJE6hYTlRn+74QsEIX7MYZXjmSAdrJ/Idw+qrI1B0M32PWzoCIliUfFysvnvcqcxq2yxsPDvlA09XaaXy/GBeUuReD+aV9Bip2//0mwcr58b723i3LQ5IyxuBkoIR49mUDXRcNEr/EpQFMUktGf7mnUtQiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751213987; c=relaxed/simple;
	bh=vVYeLBvjVjR0sMO8frCxn890JM8yRGV9ydEkNyBmuUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pkTRItjYfYH3X5xziX75fkaHp8//3dK2YChPUwjDoNL8mX22Njc0X702fvUohCmNMOFq2qJojGfcP89fskbZpyzOXYMdFZkFgGT57qGB7hZTrl62Eqwol3C6iAcNSsDXO/0zl89XEQJZaKgUYuG6KhpqNWQZsbHJMaYenB9HEDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gtfrsb0n; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gtfrsb0n"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso2754956a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751213982; x=1751818782; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=traKKCjx3BMHy277JUmrMiYEkCEmT+OWsQfjfVIoc68=;
        b=gtfrsb0ntUIM4t5kIkXSu4KdnMosdy68Y8TUvw+vH6lPEPdOCauLdJMboh4aRQpEXW
         hgJ3rfurYThGunzgtxWHtBLM36sdOg8VSQ5qtHq0BrKFGkByR9+hUgyM9JO4ZH9RePui
         7SQwPSrK4qsF0LcxsAEt9+csTKG5hZV4MzLu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751213982; x=1751818782;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=traKKCjx3BMHy277JUmrMiYEkCEmT+OWsQfjfVIoc68=;
        b=HdISI8J5Pvjj6tcxXl001H8MAqQTxfzNms4g+4kt7uUZWvlOol0xpoVaCMB9AkPZcW
         SDZhTKUO583dG14x7S/iE1HG43DiHMPIIE7bj/60iS2uVMyrXPFnbjsP+ShKrAjB8D1H
         qsjBeWV2gv/ltssoidJ09L8hwUIKV0W20ysBpjyg0/BRwpzrVgMdDj+wY+IN8ooV8aP0
         ccjMU0ZZY0cobYcA4UgL5EiPl/wxeF/3LShLoW3b0vxtuMO1HIqwU7tNYGehqcmH296p
         wI0xQgyAGc3y2ZMKY30PzAMr6uUkwPoTAM28gWQaneYARxulZWyNvSUeecPUA4boDw+Q
         6z2w==
X-Forwarded-Encrypted: i=1; AJvYcCWiHKbF7O2zxU6+koh9tZoveP/t4nABDHKgFr9Bw9B8cS02oOOpVvhYqJsUHWpmkwn+hiPTuRJJM7SuObOGbFZ+Ehgk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Hi/7NNL017OV+LImg0lNLF+bTIzb9vcDqq05kTtX4yU55FY2
	RkBufC9hBzLQeojsiSwrS1Q4xPrYrzOTQtd+XgOaK16tW9PqfC9clT+jMMVgoLgMNG7GVqrstSX
	X4YgWryI=
X-Gm-Gg: ASbGncurzs+TZDduUdPk1EHXQQQrJrkzGZERx6OSAV5Y6OxJx0/xFy2/bmGGGXSIl7p
	tkGLFDdDG/LGefYVAgn0bJACRadyDp2+LxHo+FAU/gbJcZnjqsh7Ui/eVQqlnDZBEnk5EwXuBPL
	N7siSOTk71MjLmS3tq4LKFpFN08PQH24CaIx+cdNvH6N3p+Y/m/dad0jo3NBQn8Adu6IBN05ZR5
	w/xawK59RNB+oQ8p/B/hW63ypW8E4X2zd8uDS5FcWw44Lcr5k4oBmFQUDqFLVGBAmkn72on8pwd
	NwzBlM9L1mDuGVnJ2hl9OlbU07ya3HGI0VeP78qz/LJSYvZXkncUpRrZpsX3ki7oAp0qIEjFPPw
	mEVET+xrs7PD5WxsRw1shH/fo8oBJRchk7zXL
X-Google-Smtp-Source: AGHT+IFcM1e68F/XN7uaKBuCY2iTgraLuSglRa17GI4Ju/TC5iCsb5enpB6tqg1kq7V6GpQ+hJq2og==
X-Received: by 2002:a05:6402:1ed0:b0:609:241:1deb with SMTP id 4fb4d7f45d1cf-60c88b46ae6mr10229271a12.10.1751213982461;
        Sun, 29 Jun 2025 09:19:42 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290e37csm4404310a12.31.2025.06.29.09.19.41
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 09:19:41 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso2754926a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 09:19:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3mnah3I4xScs1l/LrBCFa3kdqh6qT5a7AcxTDC6M4qvvW68UymEL6vb2kKsWUTU1QpnPeEMQW0iv6BkoKK7Yg0Pmf@vger.kernel.org
X-Received: by 2002:a05:6402:2116:b0:604:e85d:8bb4 with SMTP id
 4fb4d7f45d1cf-60c88dd64e4mr8898452a12.21.1751213980771; Sun, 29 Jun 2025
 09:19:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <740368848.567654.1751195731131.ref@mail.yahoo.com> <740368848.567654.1751195731131@mail.yahoo.com>
In-Reply-To: <740368848.567654.1751195731131@mail.yahoo.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Jun 2025 09:19:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com>
X-Gm-Features: Ac12FXwCrwffVm7rocd_7Zs2jJAF-jLGouRxxzIGgDke97EEbiyv3R7dyBiX8j0
Message-ID: <CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com>
Subject: Fwd: Linux kernel 6.8.0-62 generic null pointer
To: Jan Graczyk <jangraczyk@yahoo.ca>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dell.Client.Kernel@dell.com, PDx86 <platform-driver-x86@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000403fe50638b8473f"

--000000000000403fe50638b8473f
Content-Type: text/plain; charset="UTF-8"

Jan - please don't email me in private about bug reports, these things
should go to the proper mailing lists.

I've added more people and more lists to the participant list. The
decoded oops code is

   0: e8 50 09 9c e1        call   0xffffffffe19c0955
   5: 85 c0                test   %eax,%eax
   7: 75 d5                jne    0xffffffffffffffde
   9: 45 85 ff              test   %r15d,%r15d
   c: 78 45                js     0x53
   e: 48 c7 c6 30 40 00 c1 mov    $0xffffffffc1004030,%rsi
  15: 44 89 ff              mov    %r15d,%edi
  18: e8 e8 f7 ff ff        call   0xfffffffffffff805
  1d: 49 89 c4              mov    %rax,%r12
  20: 48 85 c0              test   %rax,%rax
  23: 74 4c                je     0x71
  25: 48 8b 40 08          mov    0x8(%rax),%rax
  29:* 83 78 60 02          cmpl   $0x2,0x60(%rax) <-- trapping instruction
  2d: 75 4b                jne    0x7a
  2f: 48 8b 7d d0          mov    -0x30(%rbp),%rdi
  33: 48 8b 48 68          mov    0x68(%rax),%rcx
  37: be 00 10 00 00        mov    $0x1000,%esi

and while this driver is doing some annoying things (it has three
different functions all called "current_value_show()" for different
cases), it seems to be the either the enum-attributes.c  or
string-attributes.c one, and that "cmpl $2" instruction that oopses
looks to be this code:

        if (obj->package.elements[CURRENT_VAL].type != ACPI_TYPE_STRING) {
                kfree(obj);
                return -EINVAL;
        }

on line 26 in

   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c

or line 28 in

   drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c

which has pretty much the exact same code. Annoying stupid "same
function name, pretty much same function, hard to tell which of them
was triggered".

Both copies of that code have checked that 'obj' is not NULL earlier:

        if (!obj)
                return -EIO;

which is that

  20: 48 85 c0              test   %rax,%rax
  23: 74 4c                je     0x71

sequence,  but it neither checks that the 'obj->package.elements'
pointer isn't NULL., and just dereferences that array directly:

  25: 48 8b 40 08          mov    0x8(%rax),%rax
  29:* 83 78 60 02          cmpl   $0x2,0x60(%rax) <-- trapping instruction

and the value of %rax clearly is NULL:

   RSP: 0018:ffffae84611f7aa0 EFLAGS: 00010282
   RAX: 0000000000000000 RBX: 000000000000002d RCX: 0000000000000000
   RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
   RBP: ffffae84611f7ad0 R08: 0000000000000000 R09: 0000000000000000
   R10: 0000000000000000 R11: 0000000000000000 R12: ffff979dcdf65e40

which is why it oopses with that

   BUG: kernel NULL pointer dereference, address: 0000000000000060
   RIP: 0010:current_value_show+0x84/0xf0 [dell_wmi_sysman]

The band-aid fix looks fairly obvious:

  -       if (!obj)
  +       if (!obj || !obj->package.elements)
                  return -EIO;

in both places, but I wonder if there's something more fundamentally
wrong there that the elements array doesn't exist.

I suspect the registration code should be more careful, and not even
create that sysfs file when the ACPI object doesn't exist, or the
package.elements pointer is NULL.

So I will leave the proper fix for the Dell sysman driver people to work out.

NOTE! While I think this particular oops is for that enum-attributes.c
or string-attributes.c cases, the exact same issue exists in the
int-attributes.c copy (that checks for ACPI_TYPE_INTEGER instead - the
difference is just a "cmpl $1" instead of "$2").

              Linus

---------- Forwarded message ---------
From: Jan Graczyk <jangraczyk@yahoo.ca>
Date: Sun, 29 Jun 2025 at 04:16
Subject: Linux kernel 6.8.0-62 generic null pointer
To: linus@linuxfoundation.org <linus@linuxfoundation.org>


Hello Linus,

Yesterday I have experienced sudden crash on my laptop running Ubuntu
24.04.2 LTS. I have attached the part of dmesg. So far I was not
involved in contribution to Linux open source code foundation. However
I would be very happy to start contributing. Looking forward to
hearing from you soon.

Best Regards,

Jan Graczyk
Mobile: +48 535 045 515

--000000000000403fe50638b8473f
Content-Type: application/octet-stream; 
	name="Linux_kernel_6.8.0-62-generic_null_pointer"
Content-Disposition: attachment; 
	filename="Linux_kernel_6.8.0-62-generic_null_pointer"
Content-Transfer-Encoding: base64
Content-ID: <99047b94-a85c-114f-ea93-763c9653e3c8@yahoo.com>
X-Attachment-Id: 197bc66ca29a0eaa8dc1

WzI4ODExLjA4NzkwOV0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRy
ZXNzOiAwMDAwMDAwMDAwMDAwMDYwClsyODgxMS4wODc5MTVdICNQRjogc3VwZXJ2aXNvciByZWFk
IGFjY2VzcyBpbiBrZXJuZWwgbW9kZQpbMjg4MTEuMDg3OTE3XSAjUEY6IGVycm9yX2NvZGUoMHgw
MDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKWzI4ODExLjA4NzkxOV0gUEdEIDAgUDREIDAgClsyODgx
MS4wODc5MjFdIE9vcHM6IDAwMDAgWyM3Ml0gUFJFRU1QVCBTTVAgTk9QVEkKWzI4ODExLjA4Nzky
M10gQ1BVOiAxMyBQSUQ6IDEwNDQyNSBDb21tOiBmd3VwZCBUYWludGVkOiBQICAgICAgRCAgICBP
ICAgICAgIDYuOC4wLTYyLWdlbmVyaWMgIzY1LVVidW50dQpbMjg4MTEuMDg3OTI2XSBIYXJkd2Fy
ZSBuYW1lOiBEZWxsIEluYy4gWFBTIDE1IDk1MDAvMFhXVDJGLCBCSU9TIDEuMzYuMSAwNC8yOC8y
MDI1ClsyODgxMS4wODc5MjddIFJJUDogMDAxMDpjdXJyZW50X3ZhbHVlX3Nob3crMHg4NC8weGYw
IFtkZWxsX3dtaV9zeXNtYW5dClsyODgxMS4wODc5MzRdIENvZGU6IDAwIGU4IDUwIDA5IDljIGUx
IDg1IGMwIDc1IGQ1IDQ1IDg1IGZmIDc4IDQ1IDQ4IGM3IGM2IDMwIDQwIDAwIGMxIDQ0IDg5IGZm
IGU4IGU4IGY3IGZmIGZmIDQ5IDg5IGM0IDQ4IDg1IGMwIDc0IDRjIDQ4IDhiIDQwIDA4IDw4Mz4g
NzggNjAgMDIgNzUgNGIgNDggOGIgN2QgZDAgNDggOGIgNDggNjggYmUgMDAgMTAgMDAgMDAgNDgg
YzcgYzIKWzI4ODExLjA4NzkzN10gUlNQOiAwMDE4OmZmZmZhZTg0NjExZjdhYTAgRUZMQUdTOiAw
MDAxMDI4MgpbMjg4MTEuMDg3OTQwXSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAwMDAw
MDAwMDAwMDJkIFJDWDogMDAwMDAwMDAwMDAwMDAwMApbMjg4MTEuMDg3OTQxXSBSRFg6IDAwMDAw
MDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwIFJESTogMDAwMDAwMDAwMDAwMDAwMApb
Mjg4MTEuMDg3OTQyXSBSQlA6IGZmZmZhZTg0NjExZjdhZDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAw
IFIwOTogMDAwMDAwMDAwMDAwMDAwMApbMjg4MTEuMDg3OTQ0XSBSMTA6IDAwMDAwMDAwMDAwMDAw
MDAgUjExOiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogZmZmZjk3OWRjZGY2NWU0MApbMjg4MTEuMDg3
OTQ1XSBSMTM6IGZmZmY5NzlkYzdiYmE3MDggUjE0OiBmZmZmOTc5ZGVlZDgwMDAwIFIxNTogMDAw
MDAwMDAwMDAwMDAyZApbMjg4MTEuMDg3OTQ2XSBGUzogIDAwMDA3MTRmMWI5YmNiODAoMDAwMCkg
R1M6ZmZmZjk3YWQwZDY4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsyODgxMS4w
ODc5NDhdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMK
WzI4ODExLjA4Nzk0OV0gQ1IyOiAwMDAwMDAwMDAwMDAwMDYwIENSMzogMDAwMDAwMDJiZTZiNjAw
NCBDUjQ6IDAwMDAwMDAwMDA3NzA2ZjAKWzI4ODExLjA4Nzk1MV0gUEtSVTogNTU1NTU1NTQKWzI4
ODExLjA4Nzk1M10gQ2FsbCBUcmFjZToKWzI4ODExLjA4Nzk1NF0gIDxUQVNLPgpbMjg4MTEuMDg3
OTU2XSAgPyBzaG93X3JlZ3MrMHg2ZC8weDgwClsyODgxMS4wODc5NjBdICA/IF9fZGllKzB4MjQv
MHg4MApbMjg4MTEuMDg3OTYzXSAgPyBwYWdlX2ZhdWx0X29vcHMrMHg5OS8weDFiMApbMjg4MTEu
MDg3OTY3XSAgPyBkb191c2VyX2FkZHJfZmF1bHQrMHgyZWEvMHg2NzAKWzI4ODExLjA4Nzk3MF0g
ID8gZXhjX3BhZ2VfZmF1bHQrMHg4My8weDFiMApbMjg4MTEuMDg3OTczXSAgPyBhc21fZXhjX3Bh
Z2VfZmF1bHQrMHgyNy8weDMwClsyODgxMS4wODc5NzhdICA/IGN1cnJlbnRfdmFsdWVfc2hvdysw
eDg0LzB4ZjAgW2RlbGxfd21pX3N5c21hbl0KWzI4ODExLjA4Nzk4MV0gIHdtaV9zeXNtYW5fYXR0
cl9zaG93KzB4MTQvMHg0MCBbZGVsbF93bWlfc3lzbWFuXQpbMjg4MTEuMDg3OTg0XSAgc3lzZnNf
a2Zfc2VxX3Nob3crMHhhNC8weDEyMApbMjg4MTEuMDg3OTg4XSAga2VybmZzX3NlcV9zaG93KzB4
MjQvMHg0MApbMjg4MTEuMDg3OTkwXSAgc2VxX3JlYWRfaXRlcisweDEyZi8weDRiMApbMjg4MTEu
MDg3OTkzXSAga2VybmZzX2ZvcF9yZWFkX2l0ZXIrMHgzNC8weDQwClsyODgxMS4wODc5OTVdICB2
ZnNfcmVhZCsweDI1Yy8weDM5MApbMjg4MTEuMDg3OTk4XSAga3N5c19yZWFkKzB4NzMvMHgxMDAK
WzI4ODExLjA4ODAwMF0gIF9feDY0X3N5c19yZWFkKzB4MTkvMHgzMApbMjg4MTEuMDg4MDAyXSAg
eDY0X3N5c19jYWxsKzB4MWJmMC8weDI1YTAKWzI4ODExLjA4ODAwNV0gIGRvX3N5c2NhbGxfNjQr
MHg3Zi8weDE4MApbMjg4MTEuMDg4MDA3XSAgPyBfX3BmeF9rZnJlZV9saW5rKzB4MTAvMHgxMApb
Mjg4MTEuMDg4MDEwXSAgPyBwdXRuYW1lKzB4NWIvMHg4MApbMjg4MTEuMDg4MDEyXSAgPyBkb19z
eXNfb3BlbmF0MisweDlmLzB4ZTAKWzI4ODExLjA4ODAxNV0gID8gX194NjRfc3lzX29wZW5hdCsw
eDU1LzB4YTAKWzI4ODExLjA4ODAxN10gID8gc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZSsweDg2
LzB4MjYwClsyODgxMS4wODgwMjBdICA/IGRvX3N5c2NhbGxfNjQrMHg4Yy8weDE4MApbMjg4MTEu
MDg4MDIyXSAgPyBfX2ZwdXQrMHgxNjAvMHgyZTAKWzI4ODExLjA4ODAyNV0gID8gX19mcHV0X3N5
bmMrMHgxYy8weDMwClsyODgxMS4wODgwMjZdICA/IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUr
MHg4Ni8weDI2MApbMjg4MTEuMDg4MDI5XSAgPyBkb19zeXNjYWxsXzY0KzB4OGMvMHgxODAKWzI4
ODExLjA4ODAzMV0gID8gZG9fc3lzY2FsbF82NCsweDhjLzB4MTgwClsyODgxMS4wODgwMzNdICA/
IGhydGltZXJfaW50ZXJydXB0KzB4MTFmLzB4MjUwClsyODgxMS4wODgwMzZdICA/IGlycWVudHJ5
X2V4aXRfdG9fdXNlcl9tb2RlKzB4N2IvMHgyNjAKWzI4ODExLjA4ODAzOF0gID8gY2xlYXJfYmhi
X2xvb3ArMHgxNS8weDcwClsyODgxMS4wODgwNDBdICA/IGNsZWFyX2JoYl9sb29wKzB4MTUvMHg3
MApbMjg4MTEuMDg4MDQyXSAgPyBjbGVhcl9iaGJfbG9vcCsweDE1LzB4NzAKWzI4ODExLjA4ODA0
NF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc4LzB4ODAKWzI4ODExLjA4ODA0
Nl0gUklQOiAwMDMzOjB4NzE0ZjFkNzFiYTlhClsyODgxMS4wODgwNzddIENvZGU6IDU1IDQ4IDg5
IGU1IDQ4IDgzIGVjIDIwIDQ4IDg5IDU1IGU4IDQ4IDg5IDc1IGYwIDg5IDdkIGY4IGU4IGM4IGNh
IGY3IGZmIDQ4IDhiIDU1IGU4IDQ4IDhiIDc1IGYwIDQxIDg5IGMwIDhiIDdkIGY4IDMxIGMwIDBm
IDA1IDw0OD4gM2QgMDAgZjAgZmYgZmYgNzcgMmUgNDQgODkgYzcgNDggODkgNDUgZjggZTggMjIg
Y2IgZjcgZmYgNDggOGIKWzI4ODExLjA4ODA3OF0gUlNQOiAwMDJiOjAwMDA3ZmZmZDk0Y2QxMjAg
RUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAwMApbMjg4MTEuMDg4MDgx
XSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwNWUzM2QzMzY3MGYwIFJDWDogMDAwMDcx
NGYxZDcxYmE5YQpbMjg4MTEuMDg4MDgyXSBSRFg6IDAwMDAwMDAwMDAwMDEwMDAgUlNJOiAwMDAw
NWUzM2QzM2JlMDcwIFJESTogMDAwMDAwMDAwMDAwMDAwOQpbMjg4MTEuMDg4MDgzXSBSQlA6IDAw
MDA3ZmZmZDk0Y2QxNDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMTAw
MApbMjg4MTEuMDg4MDg0XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDEgUjExOiAwMDAwMDAwMDAwMDAw
MjQ2IFIxMjogMDAwMDdmZmZkOTRjZDMzOApbMjg4MTEuMDg4MDg1XSBSMTM6IDAwMDAwMDAwMDAw
MDAwMDAgUjE0OiAwMDAwN2ZmZmQ5NGNkMzEwIFIxNTogMDAwMDAwMDAwMDAwMDAwOQpbMjg4MTEu
MDg4MDg4XSAgPC9UQVNLPgpbMjg4MTEuMDg4MDg5XSBNb2R1bGVzIGxpbmtlZCBpbjogdHlwZWNf
ZGlzcGxheXBvcnQgd2lyZWd1YXJkIGN1cnZlMjU1MTlfeDg2XzY0IGxpYmNoYWNoYTIwcG9seTEz
MDUgY2hhY2hhX3g4Nl82NCBwb2x5MTMwNV94ODZfNjQgbGliY3VydmUyNTUxOV9nZW5lcmljIGxp
YmNoYWNoYSBpcDZfdWRwX3R1bm5lbCB1ZHBfdHVubmVsIG5mX2Nvbm50cmFja19uZXRsaW5rIG5m
bmV0bGlua19hY2N0IHVkcF9kaWFnIHRjcF9kaWFnIGluZXRfZGlhZyB4dF9zZXQgaXBfc2V0IHh0
X2FkZHJ0eXBlIHhmcm1fdXNlciB4ZnJtX2FsZ28gY2NtIG1pY2hhZWxfbWljIHJmY29tbSBzbmRf
c2VxX2R1bW15IHNuZF9ocnRpbWVyIHh0X0NIRUNLU1VNIHh0X01BU1FVRVJBREUgeHRfY29ubnRy
YWNrIGlwdF9SRUpFQ1QgbmZfcmVqZWN0X2lwdjQgeHRfdGNwdWRwIG5mdF9jb21wYXQgbmZ0X2No
YWluX25hdCBuZl9uYXQgbmZfY29ubnRyYWNrIG5mX2RlZnJhZ19pcHY2IG5mX2RlZnJhZ19pcHY0
IG5mX3RhYmxlcyBsaWJjcmMzMmMgc25kX2hkYV9jb2RlY19oZG1pIGNtYWMgYWxnaWZfaGFzaCBh
bGdpZl9za2NpcGhlciBhZl9hbGcgYm5lcCBzdW5ycGMgc25kX2N0bF9sZWQgc25kX2hkYV9jb2Rl
Y19yZWFsdGVrIHNuZF9oZGFfY29kZWNfZ2VuZXJpYyBudmlkaWFfdXZtKFBPKSBxcnRyX21oaSBp
bnRlbF91bmNvcmVfZnJlcXVlbmN5IGludGVsX3VuY29yZV9mcmVxdWVuY3lfY29tbW9uIGludGVs
X3RjY19jb29saW5nIHg4Nl9wa2dfdGVtcF90aGVybWFsIGludGVsX3Bvd2VyY2xhbXAgc25kX3Nv
Zl9wY2lfaW50ZWxfY25sIHNuZF9zb2ZfaW50ZWxfaGRhX2NvbW1vbiBzb3VuZHdpcmVfaW50ZWwg
c25kX3NvZl9pbnRlbF9oZGFfbWxpbmsgc291bmR3aXJlX2NhZGVuY2Ugc25kX3NvZl9pbnRlbF9o
ZGEgc25kX3NvZl9wY2kgc25kX3NvZl94dGVuc2FfZHNwIHNuZF9zb2Ygc25kX3NvZl91dGlscyBz
bmRfc29jX2hkYWNfaGRhIHNuZF9oZGFfZXh0X2NvcmUgc25kX3NvY19hY3BpX2ludGVsX21hdGNo
IHNuZF9zb2NfYWNwaQpbMjg4MTEuMDg4MTI3XSAgc291bmR3aXJlX2dlbmVyaWNfYWxsb2NhdGlv
biBzb3VuZHdpcmVfYnVzIGNvcmV0ZW1wIHNuZF9zb2NfY29yZSBrdm1faW50ZWwgc25kX2NvbXBy
ZXNzIGFjOTdfYnVzIHNuZF9wY21fZG1hZW5naW5lIGJpbmZtdF9taXNjIHNuZF9oZGFfaW50ZWwg
a3ZtIHNuZF9pbnRlbF9kc3BjZmcgc25kX2ludGVsX3Nkd19hY3BpIHNuZF9oZGFfY29kZWMgcXJ0
ciBzbmRfaGRhX2NvcmUgaXJxYnlwYXNzIHNuZF9od2RlcCBjcmN0MTBkaWZfcGNsbXVsIHBvbHl2
YWxfY2xtdWxuaSBhdGgxMWtfcGNpIHBvbHl2YWxfZ2VuZXJpYyBudmlkaWFfZHJtKFBPKSBzbmRf
cGNtIGdoYXNoX2NsbXVsbmlfaW50ZWwgc2hhMjU2X3Nzc2UzIGF0aDExayBzaGExX3Nzc2UzIGFl
c25pX2ludGVsIGNtZGxpbmVwYXJ0IGNyeXB0b19zaW1kIHNuZF9zZXFfbWlkaSBjcnlwdGQgc25k
X3NlcV9taWRpX2V2ZW50IHNwaV9ub3Igc25kX3Jhd21pZGkgcmFwbCBxbWlfaGVscGVycyBkZWxs
X2xhcHRvcCBudmlkaWFfbW9kZXNldChQTykgc2NoX2ZxX2NvZGVsIG5sc19pc284ODU5XzEgbnZp
ZGlhKFBPKSBlZTEwMDQgaW50ZWxfcmFwbF9tc3IgcHJvY2Vzc29yX3RoZXJtYWxfZGV2aWNlX3Bj
aV9sZWdhY3kgbXRkIGRlbGxfd21pIG1laV9oZGNwIG1laV9weHAgaTkxNSBkZWxsX3dtaV9kZHYg
ZGVsbF9zbW1faHdtb24gaW50ZWxfY3N0YXRlIGhjaV91YXJ0IHNuZF9zZXEgcHJvY2Vzc29yX3Ro
ZXJtYWxfZGV2aWNlIG1hYzgwMjExIHV2Y3ZpZGVvIGJ0cWNhIHByb2Nlc3Nvcl90aGVybWFsX3d0
X2hpbnQgcHJvY2Vzc29yX3RoZXJtYWxfcmZpbSBidHJ0bCBkZWxsX3NtYmlvcyBzbmRfc2VxX2Rl
dmljZSB2aWRlb2J1ZjJfdm1hbGxvYyBwcm9jZXNzb3JfdGhlcm1hbF9yYXBsIHNuZF90aW1lciBi
dGludGVsIHV2YyBkZWxsX3dtaV9zeXNtYW4gaW50ZWxfcmFwbF9jb21tb24gaGlkX3NlbnNvcl9h
bHMgZHJtX2J1ZGR5IHZpZGVvYnVmMl9tZW1vcHMgYnRiY20gZGNkYmFzIGNmZzgwMjExIGZpcm13
YXJlX2F0dHJpYnV0ZXNfY2xhc3Mgc25kClsyODgxMS4wODgxNzFdICBsZWR0cmlnX2F1ZGlvIHZp
ZGVvYnVmMl92NGwyIHR0bSBkZWxsX3dtaV9kZXNjcmlwdG9yIGhpZF9zZW5zb3JfdHJpZ2dlciBw
cm9jZXNzb3JfdGhlcm1hbF93dF9yZXEgd21pX2Jtb2YgaW50ZWxfd21pX3RodW5kZXJib2x0IGky
Y19pODAxIHNwaV9pbnRlbF9wY2kgaW5kdXN0cmlhbGlvX3RyaWdnZXJlZF9idWZmZXIgZHJtX2Rp
c3BsYXlfaGVscGVyIHByb2Nlc3Nvcl90aGVybWFsX3Bvd2VyX2Zsb29yIGtmaWZvX2J1ZiBzb3Vu
ZGNvcmUgc3BpX2ludGVsIGkyY19zbWJ1cyB2aWRlb2RldiBibHVldG9vdGggY2VjIGxpYmFyYzQg
dmlkZW9idWYyX2NvbW1vbiBoaWRfc2Vuc29yX2lpb19jb21tb24gcHJvY2Vzc29yX3RoZXJtYWxf
bWJveCBtZWlfbWUgcmNfY29yZSBtYyBtaGkgaW5kdXN0cmlhbGlvIGludGVsX3NvY19kdHNfaW9z
ZiBtZWkgaTJjX2FsZ29fYml0IGVjZGhfZ2VuZXJpYyBlY2MgaW50ZWxfcGNoX3RoZXJtYWwgaW50
MzQwM190aGVybWFsIGludGVsX3BtY19jb3JlIGludDM0MHhfdGhlcm1hbF96b25lIGludGVsX3Zz
ZWMgcG10X3RlbGVtZXRyeSBpbnQzNDAwX3RoZXJtYWwgam95ZGV2IHBtdF9jbGFzcyBpbnRlbF9o
aWQgYWNwaV90YWQgYWNwaV90aGVybWFsX3JlbCBhY3BpX3BhZCBpbnB1dF9sZWRzIHNwYXJzZV9r
ZXltYXAgc2VyaW9fcmF3IG1hY19oaWQgb3ZlcmxheSBpcHRhYmxlX2ZpbHRlciBpcDZ0YWJsZV9m
aWx0ZXIgaXA2X3RhYmxlcyBicl9uZXRmaWx0ZXIgYnJpZGdlIHN0cCBsbGMgYXJwX3RhYmxlcyBt
c3IgcGFycG9ydF9wYyBwcGRldiBscCBwYXJwb3J0IGVmaV9wc3RvcmUgbmZuZXRsaW5rIGRtaV9z
eXNmcyBpcF90YWJsZXMgeF90YWJsZXMgYXV0b2ZzNCB1c2JoaWQgY2RjX2V0aGVyIHVzYm5ldCBy
ODE1MiBtaWkgaGlkX3NlbnNvcl9odWIgaW50ZWxfaXNodHBfaGlkIGhpZF9tdWx0aXRvdWNoIGhp
ZF9nZW5lcmljIDgyNTBfZHcgcnRzeF9wY2lfc2RtbWMgbnZtZSBjcmMzMl9wY2xtdWwgcHNtb3Vz
ZSB0aHVuZGVyYm9sdCBudm1lX2NvcmUgdWNzaV9hY3BpClsyODgxMS4wODgyMjBdICBpbnRlbF9s
cHNzX3BjaSB0eXBlY191Y3NpIG52bWVfYXV0aCBydHN4X3BjaSBpbnRlbF9pc2hfaXBjIGludGVs
X2xwc3MgaTJjX2hpZF9hY3BpIHZpZGVvIHhoY2lfcGNpIHR5cGVjIGkyY19oaWQgaW50ZWxfaXNo
dHAgeGhjaV9wY2lfcmVuZXNhcyBpZG1hNjQgaGlkIHdtaSBwaW5jdHJsX2Nhbm5vbmxha2UKWzI4
ODExLjA4ODIzMV0gQ1IyOiAwMDAwMDAwMDAwMDAwMDYwClsyODgxMS4wODgyMzNdIC0tLVsgZW5k
IHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQpbMjg4MTEuMTE0OTQyXSBSSVA6IDAwMTA6Y3Vy
cmVudF92YWx1ZV9zaG93KzB4ODQvMHhmMCBbZGVsbF93bWlfc3lzbWFuXQpbMjg4MTEuMTE0OTUx
XSBDb2RlOiAwMCBlOCA1MCAwOSA5YyBlMSA4NSBjMCA3NSBkNSA0NSA4NSBmZiA3OCA0NSA0OCBj
NyBjNiAzMCA0MCAwMCBjMSA0NCA4OSBmZiBlOCBlOCBmNyBmZiBmZiA0OSA4OSBjNCA0OCA4NSBj
MCA3NCA0YyA0OCA4YiA0MCAwOCA8ODM+IDc4IDYwIDAyIDc1IDRiIDQ4IDhiIDdkIGQwIDQ4IDhi
IDQ4IDY4IGJlIDAwIDEwIDAwIDAwIDQ4IGM3IGMyClsyODgxMS4xMTQ5NTNdIFJTUDogMDAxODpm
ZmZmYWU4NDRiZDlmYTE4IEVGTEFHUzogMDAwMTAyODIKWzI4ODExLjExNDk1NV0gUkFYOiAwMDAw
MDAwMDAwMDAwMDAwIFJCWDogMDAwMDAwMDAwMDAwMDAwZSBSQ1g6IDAwMDAwMDAwMDAwMDAwMDAK
WzI4ODExLjExNDk1Nl0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAw
MCBSREk6IDAwMDAwMDAwMDAwMDAwMDAKWzI4ODExLjExNDk1N10gUkJQOiBmZmZmYWU4NDRiZDlm
YTQ4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKWzI4ODExLjEx
NDk1OV0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZm
ZmY5NzlkY2Y4NGMyZTAKWzI4ODExLjExNDk2MF0gUjEzOiBmZmZmOTc5ZGM3YjdiMDAwIFIxNDog
ZmZmZjk3OWRlZWQ4MDAwMCBSMTU6IDAwMDAwMDAwMDAwMDAwMGUKWzI4ODExLjExNDk2MV0gRlM6
ICAwMDAwNzE0ZjFiOWJjYjgwKDAwMDApIEdTOmZmZmY5N2FkMGQ2ODAwMDAoMDAwMCkga25sR1M6
MDAwMDAwMDAwMDAwMDAwMApbMjg4MTEuMTE0OTYzXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAw
MDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzClsyODgxMS4xMTQ5NjRdIENSMjogMDAwMDAwMDAwMDAw
MDA2MCBDUjM6IDAwMDAwMDAyYmU2YjYwMDQgQ1I0OiAwMDAwMDAwMDAwNzcwNmYwClsyODgxMS4x
MTQ5NjVdIFBLUlU6IDU1NTU1NTU0ClsyODgxMS4xMTQ5NjddIG5vdGU6IGZ3dXBkWzEwNDQyNV0g
ZXhpdGVkIHdpdGggaXJxcyBkaXNhYmxlZAoK
--000000000000403fe50638b8473f--
