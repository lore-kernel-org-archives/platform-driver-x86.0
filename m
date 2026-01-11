Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A7348884
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Jan 2026 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768154260; cv=none; b=Ppt4ahKmgASflPGgiQhkxdHQ5eOj6AOhUcq7nIKCr1N4PiFhoQs2NdFNkAdchxVJNwlCgzSZlHDNIv2PETL3EaNzfZAIR1aay+MqQC5abdl4OlS02ZcO2AaGdp2v55n0+aA60i8hGQaqzyDLbdIPuwDa10e7z4vk0VFGGF+d5Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768154260; c=relaxed/simple;
	bh=fbJK7xOI/xq6Tar8qezI6hVv8dspBtPq2Jhl4huh3nY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcbtxslvo3zoLZGEoVeBcp/TNd+TTts1MULo4jxJVwbXEdBiWoZ18ip3shPBHgocOUMcpbd87fDsCPxDWYzBocRpQAEZeDv3biwqWdjRN09C5tnqZzkM7S9Zy5Fx3a28h9ENsA96yuemmttzyIw6DsFM2Mk4ZbvUzZMRaxLNjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxuE3rHf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxuE3rHf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b05daf2e4eso82817eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Jan 2026 09:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768154258; x=1768759058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbJK7xOI/xq6Tar8qezI6hVv8dspBtPq2Jhl4huh3nY=;
        b=mxuE3rHf/Gdpqbss+uKujK4jg/ftTr7Aw1KdFKgW5ryvOT9GdvcAR5rqHFoIt43CtJ
         QZe23wYie35xSFIXf/ds91Fn0KUyOiIwMALy+Ifpgu1k7QTz3yGgpYbf+vqZJzlpk1TJ
         e/lp1LWqtmnxMfGH0VHJLea6Ou230ZRKqlZwM7si+ltca/1TwgPJpZvoupYycrkDm3XH
         XmpIqD4rRe7AFTm7khy48+Sl9PHaUQF4/Sxzj8JJX+qhQNozDttPbJ+r2c+I3FG/YWuM
         jQKaPM/iXzh0ZbQt6kA/czIwi/y0OREq91O2rbjloGOg+o0arJo5F2Y03u2gP6yac6uv
         5y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768154258; x=1768759058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbJK7xOI/xq6Tar8qezI6hVv8dspBtPq2Jhl4huh3nY=;
        b=CzqegQ6oa+Vdz1FaE90ZNRl/6d+SLzIJFbhvpgWCQHUgjHiTqG9934amwMd6LHUFia
         rtvyVThzPM4q0iYEwavkvxf5TRvsBj7yEOQErG/9CX1NAdZpIKPAIdI4K7drHk2LZnsH
         xioi4nOx44N1hAEzw3PqzxDoycUzdEdaxj0V1fEPlzUBXxpcl2zunW6xHqpjL1rPuCp/
         ATcUa2AmsAQ08NNBZrvVUVxKJ0x4TnXwFs+Oz36v8G0jZ8ntgThM7rM5XHAcycxLNAOp
         XxWnq74T81kaIsaIsdbS7RwSKfLAyKFN1ZqQyNJBq4/V08+ST/kEtpJSMG6LhUL5URXl
         RVvA==
X-Forwarded-Encrypted: i=1; AJvYcCV7JuIM03swDjm7gsJRvmTqhBsFe6A4651FqR2n8V9smYZH+MPVaQYsSR0QXR8KSrFk8dMO6IK0dO/8qlQqil7IT9sd@vger.kernel.org
X-Gm-Message-State: AOJu0YykYZ+yywJtLi08CKvK3FW+wFbnc/U/dM6cQd9Al9KtP0cbrwBm
	Osv0qbM7P7vVHkZZbG/qoqdhpPzB4+VDX7jgxyE3mE6Gc6D4hyjbnvbf3TCDOi5lLFIuVUH1Sk7
	tBXoLTGKv0Lu/MXXr05A28m2w50un2TE=
X-Gm-Gg: AY/fxX4v+q3Vf1u3Kg0z6FL9izWB6tnULb2lhNUpq9d07+nzB4+ds5s6/3bTTePMEif
	aWzmUUBbbzN1g7WSPNwZWlkpUA02vufgb3Fwqr1BgJm98lFnsaQz/vdKn/8wRfmNCIXWCNZb6S8
	r1GZlYGAdTdtrogThU/grmRcB2siy+0gpcdCCxZH0HGSh6k3nHXzr+PTZWDlkX3dB0V84384jh5
	/fnloATr6uTQch4B67DXAf1Kw7Pm+M4oIK76iTZNH2TmztVVyfUvok1EVaX4Zh2dCw3lWw3+8qG
	TCj21qFh1Ky35/2b3zW2ghSRMsyS0wb4ptX0NFqccmSkQOYbPNhN7ocUrwsvkgo/1VRrk97AWX1
	DE1y2rBmW83yE
X-Google-Smtp-Source: AGHT+IHsUNDTkZWXPnDKsokQQfGSgLB5pLSBd31BRF2afyEHDMLGxpLMw7U1an74C6nf4v5M3uxlrayIC4FhizbbcvI=
X-Received: by 2002:a05:7301:fa0f:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2b17d23fd01mr8560661eec.2.1768154257822; Sun, 11 Jan 2026
 09:57:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <05261e88ac8503e2af59d703389d94cc15f4450d.1767818037.git.foxido@foxido.dev>
 <20260108132141.6cce4827.gary@garyguo.net> <7b8130de-8096-4fcb-be84-c13209638b25@foxido.dev>
 <CANiq72=TAXwjjxFiKiiwh9m_rRK_yUVS4b+2st=QJWErz5qTpQ@mail.gmail.com> <b8e2c3ed-7db1-48ca-8dc8-64dfa437c595@foxido.dev>
In-Reply-To: <b8e2c3ed-7db1-48ca-8dc8-64dfa437c595@foxido.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Jan 2026 18:57:24 +0100
X-Gm-Features: AZwV_QjkEeEeUhKFkM_68O4DnxLwqPiN_AxlqeD2e8VEqMZVrLimsVfRWFtZI4Q
Message-ID: <CANiq72n27gF0e3r_pZ_6ZD7EBhwCLghFkQtLwfApEGCQo6gcnQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: implement wrapper for acpi_object
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Gary Guo <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 11:57=E2=80=AFAM Gladyshev Ilya <foxido@foxido.dev> =
wrote:
>
> If I understand correctly, acpi_object is something untrusted in general
> and broken hardware can provide arbitrary _type value. So ergonomics of
> enum solution would be kinda strange:
>
> ```
> type_id() -> Result<Enum> // Result because it can be invalid
>
> // ...
>
> // '?' here makes it look like non-trivial operation
> if x.type_id()? =3D=3D Enum::Buffer
> ```

Yeah, I was mentioning the `bindgen` bit because returning
`Result<Enum>` is essentially what we asked for the generated code,
i.e. we generate a panicking `From` impl, a fallible `TryFrom` impl
and an unsafe conversion method too.

Whether that may add overhead or not, it depends, of course. Sometimes
the result (i.e. the enum) may need to be used later on in several
places, and knowing statically that the value is in-bounds means there
is no need to recheck anymore for that reason.

That can actually mean reducing overhead (e.g. if checks exist in
several APIs, possibly defensively) or at least reduce the mistakes
that may be made tracking whether the value is valid or not.

But, of course, if the value is not used for anything on the Rust
side, and is just passed along, and the consumer of the value in the C
side do not have UB if it is out of range, and you generally don't
expect that to change, then checking validity upfront may indeed not
add much value like you say. From what you say (I don't know), it
seems that is the case and thus a newtype may be simpler and best.

But if those conditions change, e.g. you later start to want to
manipulate the value on the Rust side for any reason, then it will
likely be a different story. In such a case, then we shouldn't be
scared of the ergonomics of conversions, i.e. it is fine and expected
to have to do that, which is why we want to generate all that
boilerplate in `bindgen` eventually.

Or perhaps you may need both options, i.e. the newtype, and the other
one, depending on what you are doing with the value.

Regarding `ACPI_TYPE_INVALID`, yeah, it would depend on what is used
for. If nobody should be calling a given API with such a value, then
that API should return `Err`. But if it gets used as a useful marker
value somewhere, then it may need to be a valid value and thus return
`Ok`. If both cases are true, then perhaps again two ways may be
needed to model those.

Cheers,
Miguel
